function [] = line_mult_cluster(Cluster_matrix, fig_handle, ax_handle);
%[] = line_mult_cluster(Cluster_matrix, fig_handle, ax_handle);
%
%
% Function add vertical lines to the cluster matrix graph to indicate
% which elements are members of more than one cluster
%
%
%
%	Inputs:
%					Cluster_matrix		The Cluster matrix
%					fig_handle				Figure Handle to add the lines
%					ax_handle				Figure Axes handles
%
%	Outputs:

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	line_mult_cluster.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to add lines to the Cluster Matrix plot.  The vertical lines		*
%	will be placed along the elements that are members of more than one			*
%	cluster.																				*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************



[num_clusters, num_elmts] = size(Cluster_matrix);

X_lims = get(ax_handle, 'XLim');
Y_lims = get(ax_handle, 'YLim');

num_el_clusters = sum(Cluster_matrix,1);


for i = 1:num_elmts
   if num_el_clusters(1,i) > 1
      line([i i],[0 Y_lims(2)],'LineStyle',':','MarkerSize',0.5,'Color',[0.5 0.5 0.5]);
   end
end
