function []=graph_matrix(matrix, x_title, y_title, graph_title, x_tcklabel, y_tcklabel, print_flag, Cluster_matrix);
%	[]=graph_matrix(matrix, x_title, y_title, graph_title);
%
%	Function to graph the DSM or cluster matrix.
%	The data is plotted as a scatter graph and the size and color
%	of the marks are conrtrolled according to the value of the input
%
%			Inputs:
%						matrix				matrix to be plotted on scatter graph
%						x_title			string containing label for x-axis
%						y_title			string containing label for y-axis
%						graph_title		title for the graph
%						x_tcklabel			labels to be placed along the x-axis
%						y_tcklabel			labels to be placed along the y-axis
%						print_flag			flag to toggle printing 1=print, else no print
%						Cluster_matrix	Optional Cluster_matrix of plotting the clusterd DSM
%
%			Outputs:
%
%
%
%


% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	graph_matrix.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to graph the DSM matrix or cluster matrix.  If the DSM matrix				*
%	is to plotted in clustered form, the cluster matrix must also be provided.			*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************





% Are we plotting cluster boxes?
if nargin < 8
   Cluster_plot = 0;
else
   Cluster_plot = 1;
end


[row_input, column_out, m_value] = find(matrix);	% find non_zero entries

max_row = max(row_input);
max_col = max(column_out);
ax = [0 max_col+1 0 max_row+1];
max_value = max(m_value);
data_scale = ceil(500/max_value)/20;

x_tcklabel_g{1,1} = '0';
y_tcklabel_g{1,1} = '0';

for i = 1:size(x_tcklabel,1)
   x_tcklabel_g{i+1,1} = x_tcklabel{i,1};
end

for i = 1:size(y_tcklabel,1)
   y_tcklabel_g{i+1,1} = y_tcklabel{i,1};
end

figure;
clf;
scatter(column_out, row_input, m_value*data_scale, m_value,'filled','d');
axis(ax);
cur_ax = gca;
axes_scale = get(cur_ax,'Position');
set(cur_ax,'Position',[axes_scale(1) axes_scale(2) axes_scale(3) axes_scale(4)*0.9]);
set(cur_ax,'XTick',(0:1:max_col+1));
set(cur_ax,'YTick',(0:1:max_row+1));
set(cur_ax,'XAxisLocation','top','YDir','Reverse');
set(cur_ax,'XTickLabelMode','manual');
set(cur_ax,'YTickLabelMode','manual');
set(cur_ax,'XTickLabel',x_tcklabel_g);
set(cur_ax,'YTickLabel',y_tcklabel_g);
set(cur_ax,'FontSize',4);
set(cur_ax,'Box','On');


xlabel(x_title);
ylabel(y_title);
title(graph_title);
orient('landscape');

% draw squares around the clustered elements in the DSM
if Cluster_plot ==1
   Number_clusters = size(Cluster_matrix,1);
   
   sq_s = 0.5;	%Start of the square
   for cluster_indx = 1:Number_clusters
      n_el = sum(Cluster_matrix(cluster_indx,:),2);		% number of elements in cluster
      line([sq_s (sq_s + n_el) (sq_s + n_el) sq_s sq_s], [sq_s sq_s (sq_s + n_el) (sq_s + n_el) sq_s]);
      sq_s = sq_s + n_el;
   end
end

if print_flag ==1
   print
end
