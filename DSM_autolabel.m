function [numeric_DSM_labels] = DSM_autolabel(DSM_matrix);
%[numeric_DSM_labels] = DSM_autolabel(DSM_matrix);
%
%
% Function to create numeric text labels that correspond the the index
% in the DSM matrix.  Element 1 gets a text lebel of "1", etc.
%
%
%
%	Inputs:
%				DSM_matrix				The DSM matrix
%
%	Outputs:
%				mumeric_DSM_labels	Cell array of numeric text labels

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	DSM_autolabel.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to create a cell array of labels that correspond to each						*
%	entry in the DSM																				*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************



% get labels from the rows (will work for cluster matrix also)
num_labels = size(DSM_matrix,1);		% get the number of labels needed

numeric_DSM_labels = cell(num_labels,1);	% create empty cell array

for i = 1:num_labels
   numeric_DSM_labels{i,1} = num2str(i);
end
