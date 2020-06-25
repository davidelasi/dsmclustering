function [New_DSM_matrix, New_DSM_labels] = reorder_DSM_byCluster(DSM_matrix, Cluster_matrix, DSM_label);
%[New_DSM_matrix, New_DSM_labels] = reorder_DSM_byCluster(DSM_matrix, Cluster_matrix, DSM_label);
%
%
%		Inputs:
%					DSM_matrix			DSM Matrix to be re-ordered
%					Cluster_matrix		Cluster Matrix to control the re-ordering
%					DSM_label			labels of the DSM elements (lebels need to be re-ordered also)
%
%
%
%		Output:
%					New_DSM_matrix		reordered DSM matrix
%					New_DSM_labels		reordered label array 
%
%

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	reorder_DSM_byCluster.m															*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to reorder the DSM Matrix accroding the the Cluster matrix.		*
%	Place all elements in the same cluster next to each other.  If an			*
%	an element is a member of more than one cluster, duplicate that element *
%	in the DSM for each time it appears in a cluster								*
%																									*
%	The new DSM will have all elments in a cluster next to each other			*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


% place zeros along the diagonals of the DSM matrix
DSM_matrix = tril(DSM_matrix,-1) + triu(DSM_matrix,1) + diag(zeros(length(DSM_matrix),1));

% get the size of the DSM matrix
DSM_size = size(DSM_matrix,2);

% find all element-to-cluster assignments
[Cluster_number,Element] = find(Cluster_matrix);

%sort the element-to-cluster list in ascending order of clusters
[ordered_cluster_number, ClusterList_index] = sort(Cluster_number);

new_number_elmts = length(ClusterList_index);

% Get the new rows of the DSM matrix
for i = 1:new_number_elmts
   temp_DSM_matrix(i,:) = DSM_matrix(Element(ClusterList_index(i)),:);
   New_DSM_labels{i,1} = DSM_label{Element(ClusterList_index(i)),1};
end

% Now add the new columns of the DSM matrix
for i= 1:new_number_elmts
   New_DSM_matrix(:,i) = temp_DSM_matrix(:,Element(ClusterList_index(i)));
end

