% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  files:	run_cluster_B.m																*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%																									*
% Script file to load in the DSM for analysis, run the 							*
% clustering algorithm and graph the results											*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************





% **************************************************************************
%							SPECIFY & GET DSM MATRIX										*
% **************************************************************************
% name of script file containing the DSM matrix and DSM labels					*
% must contain to variables																*
%																									*
%		DSM				matrix defining the DSM interaction values				*
%																									*
%		DSMLABEL			cell array containing strings for the labels				*
%							of the DSM elements												*
%																									*
%		DSMFunc_LABEL	cell array containg the strings which label 				*
%							the functional requirements that are mapped				*
%							to the DSM elements												*
%																									*

% Elevator_DSM_varied; % enter name of DSM script file

% ********************* END GET DSM MATRIX  ********************************







% **************************************************************************
%									USER PARAMETERS											*
% **************************************************************************
%		print_flag			set to 1 to print the plotted figures					*
%																									*
%		extract_elements	defines which elements will be considered				*
%								as system elements and will not be used				*
%								for the clustering purposes								*
%								The system parameters generally contain				*
%								many entries along the row, column, or both			*
%																									*
%		Cluster_param		structure containing the parameters which				*
%								control the clustering algorithm							*
% **************************************************************************

print_flag = 0;
% extract_elements = [9,16,60,61,40,14,38,25];

%% Cluster_param.pow_cc				=	1;		% penalty assigned to cluster size(2)

Cluster_param.pow_cc				=	2;		% penalty assigned to cluster size(2)

Cluster_param.pow_bid			=	2;		% high value penalizes large clusters (0-3, 2)
Cluster_param.pow_dep			=	4;		% high value emphasizes high interactions (0-2, 2)
%% Cluster_param.max_cluster_size=	61;	% max size of cluster (DSM size)
Cluster_param.max_cluster_size=	DSM_size;	% max size of cluster (DSM size)

%% Cluster_param.rand_accept		=	122;	% proceed w/ 1 of N changes even if no improvement (0.5-2 *DSM)
%% Cluster_param.rand_bid			=	122;	% take second highest bid 1 out of N times (0.5-2 * DSM)

Cluster_param.rand_accept		=	2*DSM_size;	% proceed w/ 1 of N changes even if no improvement (0.5-2 *DSM)
Cluster_param.rand_bid			=	2*DSM_size;	% take second highest bid 1 out of N times (0.5-2 * DSM)

Cluster_param.times				=	2;		% attept time*size before check sys. stability (2)
Cluster_param.stable_limit		=	2;		% loop at least stable_limit*times*size (2)

% **************************************************************************
% *********************  END USER PARAMETERS *******************************
% **************************************************************************





% **************************************************************************
%							EXTRACT SPECIFIED SYSTEM PARAMETERS							*
% **************************************************************************

DSM_matrix = DSM;
DSM_matrix_original = DSM_matrix; % save a copy of the original DSM 

% set system parameters to zero to remove their influence during clustering
for i = 1: length(extract_elements)
   DSM_matrix(extract_elements(i),:) = 0;
   DSM_matrix(:,extract_elements(i)) = 0;
end
% ******************  END EXTRACT SYSTEM PARAMETERS *************************






% **************************************************************************
%										RUN CLUSTERING											*
% **************************************************************************

[Cluster_matrix, total_coord_cost, cost_history, old_data] = Cluster(DSM_matrix, Cluster_param);

% ************************ END RUN CLUSTERING ******************************












% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%										GRAPHING													*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************

% sort the cluster matrix by cluster size
[Cluster_matrix] = reorder_cluster(Cluster_matrix);  % sort cluster by cluster size

% Get label of axes for DSM and cluster graphs
[Cluster_label] = DSM_autolabel(Cluster_matrix);

% create generic number labels that correspond to the location
% in the original DSM
[DSM_labels] = DSM_autolabel(DSM_matrix);


% re-order the DSM matrix and labels according to the results of the cluster matrix
[New_DSM_matrix, New_DSM_labels] = reorder_DSM_byCluster(DSM_matrix_original, Cluster_matrix, DSM_labels);

% Place the value 1 along the diagonal of the DSM
[graph_DSM_matrix] = place_diag(DSM_matrix_original, 1);	
[graph_New_DSM_matrix] = place_diag(New_DSM_matrix, 1);	

% GRAPH THE MATRICES
get_date = now;		% get date and time for graphing
current_date = datestr(get_date,0);

% Create titles for the graphs
DSM_title = ['DSM Matrix;  ' current_date];
Cluster_title = ['Cluster Matrix;  '  current_date];
New_DSM_title = ['New DSM Matrix; ' current_date ';   Total Cost: ' num2str(total_coord_cost)];

% graph the original DSM Matrix
graph_matrix(graph_DSM_matrix,'E1ement','Element',DSM_title, DSM_labels, DSM_labels, print_flag);

% graph the Cluster Matrix
graph_matrix(Cluster_matrix,'Element','Cluster',Cluster_title, DSM_labels, Cluster_label, 0);

% add lines on the cluster matrix to identify elements that belong
% to more than one cluster
line_mult_cluster(Cluster_matrix,gcf, gca);
if print_flag==1
   print;
end

% graph the new DSM matrix reodered by the cluster assignments
graph_matrix(graph_New_DSM_matrix,'E1ement','Element',New_DSM_title, New_DSM_labels, New_DSM_labels, print_flag, Cluster_matrix);

% create a text list of the elements of each cluster
plot_cluster_list(Cluster_matrix, DSM_matrix, DSMLABEL, current_date, print_flag);
%% plot_cluster_list(Cluster_matrix, DSM_matrix, DSMFunc_LABEL, current_date, print_flag);


% get only the nonzero value in the cost history
% cutoff the end of the history array which was not filled in
[cost_g_zero, cg] = find(cost_history);
max_run = max(cost_g_zero);

% plot the cost history
plot(cost_history(1:max_run));
title(['Clustering Cost History;  ' current_date]);
xlabel('Change #');
ylabel('Cost');
orient landscape;
if print_flag ==1
   print;
end
% **************************************************************************
%									END GRAPHING												*
% **************************************************************************

