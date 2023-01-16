function [Cluster_matrix, total_coord_cost, cost_history, old_data] = Cluster(DSM_matrix, Cluster_param);
% [Cluster_matrix, total_coord_cost, cost_history, old_data] = Cluster(DSM_matrix, Cluster_param);
%
%	Inputs:
%				DSM_matrix			the DSM matrix
%				Cluster_param		structure containing the clustering control parameters
%
%	Outputs:
%				Cluster_matrix		cluster matrix based on the clustering algorithm
%				total_coord_cost	calculated cost of the cluster matrix solution
%				cost_history		record of the coordination cost as the algorith
%										searched for a solution
%				old_data				intermediate solutions to the clustering routine
%
%
%	Parameters of the structure "Cluster_param" include:
%		Cluster_param.pow_cc						penalty assigned to cluster size during costing
%		Cluster_param.pow_bid					penalty assigned to cluster size during bidding
%		Cluster_param.pow_dep					emphasizes high interactions
%		Cluster_param.max_cluster_size		max size of cluster
%		Cluster_param.rand_accept				randomly asccep change 1 of N times w/ no improvement
%		Cluster_param.rand_bid					randomly accept second highest bid 1 of N times
%		Cluster_param.times						attept "times" changes before checking for stability
%		Cluster_param.stable_limit				loop at least stable_limit*times*size before ending
%
%

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	Cluster.m																			*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to cluster the elements of a matrix		 								*
%	Algorithm based on work developed by Carlos Fernandez							*
%																									*
%	This function runs a clustering algorithm then calculates the cost of 	*
%	the proposed solution.  The objective is to find the solution that 		*
%	in the lowest cost solution.															*
%																									*
%	There is a higher cost for interactions that occur outside of clusters	*
%	and lower costs for interactions within clusters.  There are also 		*
%	penalties assigned to the size of clusters to avoid a solution where 	*
%	all elements are members of a single cluster.									*
%																									*
%	There results are highly dependant on the parameters passed to the 		*
%	algoreithm.																					*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************









% **************************************************************************
% 							Clustering Control Parameters 								*
% **************************************************************************
%    Extract clustering control parameters
pow_cc 			= Cluster_param.pow_cc;
pow_bid 			= Cluster_param.pow_bid;
pow_dep 			= Cluster_param.pow_dep;
max_cluster_size	= Cluster_param.max_cluster_size;
rand_accept		= Cluster_param.rand_accept;
rand_bid			= Cluster_param.rand_bid;
times				= Cluster_param.times;
stable_limit	= Cluster_param.stable_limit;
% ***************** END GETTING CLUSTERING PARAMETERS **********************






% **************************************************************************
%							Initialize Matices and arrays 								*
% **************************************************************************

DSM_size 	= 	size(DSM_matrix,2); 	% number of elements in the DSM
n_clusters	=	DSM_size;				% initial # clusters = # elements
max_repeat	= 10;  						% maximum # of times to run through calc

coordination_cost			=	zeros(DSM_size,1);
cluster_size				=	zeros(DSM_size,1);
new_cluster_matrix		=	zeros(DSM_size,DSM_size);
new_cluster_size			=	zeros(DSM_size,1);
cluster_bid					=	zeros(DSM_size,1);
new_cluster_bid			=	zeros(DSM_size,1);
new_coordination_cost	=	zeros(DSM_size,1);
rnd_elmt_arr				=	zeros(DSM_size,1);
cluster_list				=	zeros(DSM_size,1);
% ******************* END INTIALIZE MATRICES *******************************



% **************************************************************************
% 									Initialize Clustering    								*
% **************************************************************************

% **** initialize the cluster matrix along the diagonals****
%		Initial clustering: nth cluster contains the nth element
cluster_diagonals = ones(1,n_clusters);
Cluster_matrix = diag(cluster_diagonals);
cluster_size = ones(n_clusters,1);

% calculate the initial starting coordination cost of the clustering
[total_coord_cost] = Coord_Cost(DSM_matrix, Cluster_matrix, cluster_size, pow_cc);
best_coord_cost = total_coord_cost;

% create an empty array to hold the cost history
cost_history = zeros(10e3,1);
history_index = 0;

% create matrices to store the best cost and the corrresponding
% cluster size and clustrix that have been found so far
best_curr_cost = total_coord_cost;
best_curr_Clust_mat = Cluster_matrix;
best_cluster_size = cluster_size;
% ********************* END INITIALIZE CLUSTERING **************************



% **************************************************************************
% 										Clustering Routine									*
% **************************************************************************

% Initialize parameters
stable = 0;			%	toggle to indicate if the algorithm has met the stability criteria
change = 0;			%	toggle to indicate if a change should be made
accept1= 0;			%	toggle to indicate if the solution should be acccepted
first_run = 1;		%	toggle to indicate if it is the first run through
pass = 1;			%	index to count the number of passes through the algorithm

% store best cost solution and data found up to this point
old_data(pass).Cluster_matrix = Cluster_matrix;
old_data(pass).cluster_size = cluster_size;
old_data(pass).total_coord_cost = total_coord_cost;






% **** start the clustering routine ****
% continue until the results have met the stability criteria
% AND the final solution is the same or better than any intermediate solution that may
% have been found.  Due to simulated annealing, a final solution may be worse than an 
% intermediate solution that had been found before making the random change
% 
% If the final solution is not equal to or less than any best solution, then
% return to the best solution and continue to search for a better solution.
% Do this until a better solution is found or we have looped back max_repeat times.
% If we reach max_repeat, then report the best solution thathad been found.

while ( ((total_coord_cost > best_coord_cost) & (pass <= max_repeat))| (first_run == 1))
   if first_run == 0		% only if not first pass through clustering routine
      pass = pass+1;	% increment # passes
      % store the current data
      old_data(pass).Cluster_matrix = Cluster_matrix;
      old_data(pass).cluster_size = cluster_size;
      old_data(pass).total_coord_cost = total_coord_cost;
      total_coord_cost 	= best_curr_cost;
      Cluster_matrix 	= best_curr_Clust_mat;
      cluster_size 		= best_cluster_size;
      history_index 		= history_index+1;
      cost_history(history_index,1) = total_coord_cost;
   end
   % reset the toggles back to zero
   first_run	=	0;
   stable 		=	0;
   accept1 		=	0;
   change 		=	0;
   
   
   while (stable ~= stable_limit)
      for k=1:DSM_size*times;
         % (1)  pick an element in a random location in the DSM
         elmt = ceil(DSM_size*rand(1,1));% random number between 1 and DSM_size
         
         
         % (2) Accept bids for the elemement from all clusters
         % 				cluster_bid(i) holds the bid for cluster i in cluster_matatrix
         [cluster_bid]=bid(elmt, DSM_matrix, Cluster_matrix, max_cluster_size, pow_dep, pow_bid, cluster_size);
         
         
         % (3) Determine the best bid & second best bid
         best_cluster_bid = max(cluster_bid);
         secondbest_cluster_bid = max((best_cluster_bid~=cluster_bid).*cluster_bid);
         
         % simulated annealing
         if (floor(rand_bid*rand(1,1)) == 0)		% pick second best bid 1 out of rand_bid times
            best_cluster_bid = secondbest_cluster_bid;
         end
         
         
         if (best_cluster_bid>0)
            
            % (3a)  Determine if the BID is acceptable
            % Initialize
            cluster_list(:,1) = 0;
            
            % Determine the list of clusters affected
            cluster_list(1:n_clusters,1) = ((cluster_bid(:)==best_cluster_bid) & (Cluster_matrix(:,elmt)==0));
            
            
            % copy the cluster matrix into new matrices
            new_cluster_matrix	= Cluster_matrix;
            new_cluster_size 		= cluster_size;
            
            % proceed with cluster changes in the new cluster
            new_cluster_matrix(1:n_clusters,elmt) = new_cluster_matrix(1:n_clusters,elmt) | cluster_list;
            new_cluster_size(1:n_clusters) = new_cluster_size(1:n_clusters) + (cluster_list==1)*1;
            
            
            % delete any duplicate or empty clusters
            [new_cluster_matrix, new_cluster_size]= Delete_Clusters(new_cluster_size, new_cluster_matrix);
            
            % determine the change in the coordination costs
            [new_total_coord_cost] = Coord_Cost(DSM_matrix, new_cluster_matrix, new_cluster_size, pow_cc);
            if (new_total_coord_cost <= total_coord_cost)
               accept1 = 1;
            else
               if (floor(rand_accept*rand(1,1)) == 0)% still accept 1 out of approx random_accept times
                  accept1 = 1;
                  % if we are going to accept a total cost that is not less than our current cost
                  %  then
                  % save the current cost as the best current cost found so far (only if the current cost
                  % is lower than any best current cost previously saved) because we may not find
                  % a cost that is better than the current cost
                  %
                  % When we think we are finished we will check the final cost against any best cost
                  % if the final cost is not better than the lowest cost found, then we will move back to that best cost
                  if total_coord_cost < best_curr_cost
                     best_curr_cost = total_coord_cost;
                     best_curr_Clust_mat = Cluster_matrix;
                     best_cluster_size = cluster_size;
                  end
               else
                  accept1 = 0;
               end
            end
         end
         
         if (accept1)
            accept1=0;
            
            % (4) UPDATE the clusters
            total_coord_cost = new_total_coord_cost;
            Cluster_matrix = new_cluster_matrix;
            cluster_size = new_cluster_size;
            history_index = history_index+1;
            cost_history(history_index,1) = total_coord_cost;
            
            if (best_coord_cost > total_coord_cost)
               best_coord_cost = total_coord_cost;
               change = change + 1;  % improvement in coord.cost
            end
         end
      end
      
      % (5) Test the system for stability
      if (change >0)
         stable = 0;
         change = 0;
      else
         stable = stable + 1;
      end
   end
end
