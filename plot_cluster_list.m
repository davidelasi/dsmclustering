function [] = plot_cluster_list(Cluster_matrix, DSM_matrix, E_name_list, current_date, plot_flag);
%[] = plot_cluster_list(Cluster_matrix, DSM_matrix, E_name_list, current_date, plot_flag);
%
%
% Function to calculate the bids from an element to each cluster of elements
%
%
%
%	Inputs:
%					Cluster_matrix	The Cluster Mtrix
%					DSM_matrix			The DSM Matrix
%					E_name_list		Array of strings that list the elements in the cluster
%					current_date		Date string
%					plot_flag			toggle for printing; 1=print, else don't print
%
%	Outputs:
%					

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	plot_cluster_list.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to plot a text list of the clusters and the elements contained 	*
%	in the clusters.																		*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


   
	% ***************************************************************
	%									Simulation  Data
	% ***************************************************************
   % scaling factors for the plotting area
   top_of_list = 0.92;
	stepsize1 = 0.025;
	ttl_offset = 0.05;
	n=0;
   
   [non_zero_clusters, nz_el] = find(Cluster_matrix);
   num_clusters = max(non_zero_clusters);
   num_elements = size(Cluster_matrix,2);
   
   el_num_clusters = sum(Cluster_matrix,1);
   
   fig_row = 1;
   fig_base = set_plot_props(current_date);
   
   
   
   
   for i=1:num_clusters
      num_entries = sum(Cluster_matrix(i,:) > 0);
      if num_entries+n> 25
         fig_row = fig_row+1;
         n = 0;
      end
      
      if fig_row>2
         if plot_flag==1
            print;
         end
         fig_base = set_plot_props(current_date);
         fig_row = 1;
      end
      
      if fig_row ==1
         xpos1 = 0;
      else
         xpos1 = 0.6;
      end
      
      [cluster_yes,Element_yes] = find(Cluster_matrix(i,:));
      n=n+2;
      text(xpos1+ttl_offset,top_of_list-stepsize1*n,['\bf Cluster #' num2str(i)],...
         'HorizontalAlignment','Center');
      n = n+1;
      text(xpos1-0.05,top_of_list-stepsize1*n+0.02,'________________________',...
         'HorizontalAlignment','Left',...
         'interpreter','none');
      n=n+1-1;
      
      for z=1:num_entries
         
         n=n+1;
         el_DSM_num = Element_yes(z);
         listentry = [E_name_list{el_DSM_num,1} ' (' num2str(el_DSM_num) ')'];
         
         if el_num_clusters(Element_yes(z)) > 1
            text(xpos1,top_of_list-stepsize1*n,listentry,...
               'HorizontalAlignment','Left',...
               'interpreter','none',...
               'FontAngle','normal');
            text(xpos1-0.03,top_of_list-stepsize1*n,'*');
         else
            text(xpos1,top_of_list-stepsize1*n,listentry,...
               'HorizontalAlignment','Left',...
               'interpreter','none');
         end
      end
   end
   
   if plot_flag == 1
      print;
   end
   
   
   
   
   function [fignumber] = set_plot_props(current_date);
     
   fignumber = figure;
   orient tall;
   Result_Data_window = figure(fignumber);
   clf reset;
   set(Result_Data_window,'Name','Cluster List');
	ax_handle = axes;
	set(ax_handle,'Visible','Off');

	wd_units =  get(Result_Data_window,'Units');
	set(Result_Data_window,'Units','normalized');
	wd_position = get(Result_Data_window,'Position');
	wd_left = wd_position(1);
	wd_bottom = wd_position(2);
	wd_width = wd_position(3);
	wd_height = wd_position(4);
	wd_left_new = 0.1;
	wd_height_new = 0.75;
	wd_bottom_new = 0.1;
	wd_width_new = 0.5;
	wd_new_position = [wd_left_new wd_bottom_new wd_width_new wd_height_new];
	set(Result_Data_window,'Position',wd_new_position);
	set(Result_Data_window,'Units',wd_units);
	% ***************************************************************
	%								Title & Header  Data
	% ***************************************************************
	text(0.5,1,'\bf\fontsize{14} Cluster Member List',...
   	'HorizontalAlignment','Center');
	
	text(0.5,0.97,['\it ' current_date],...
   	'HorizontalAlignment','Center');
