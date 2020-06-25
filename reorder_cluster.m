function [New_Cluster_matrix] = reorder_cluster(Cluster_matrix);
%[New_Cluster_matrix] = reorder_cluster(Cluster_matrix);
%
%
% Function sort and reorder the cluster matrix by size
% Small cluster will be at the bottom of the list and large cluster
% will be moved to the top of the list
%
%	Inputs:
%				Cluster_matrix		The Cluster matrix
%
%	Outputs:
%				New_cluster_matrix	The new sorted Cluster Matrix

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	reorder_cluster.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
% Function sort and reorder the cluster matrix by size								*
% Small cluster will be at the bottom of the list and large cluster				*
% will be moved to the top of the list												*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************




Num_clstelm = sum(Cluster_matrix,2);

[Y,I] = sort(Num_clstelm,1);
flipped_I = flipud(I);
New_Cluster_matrix(:,:) = Cluster_matrix(flipped_I,:);

