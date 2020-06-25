function [new_matrix] = place_diag(old_matrix, diagonal_element);
%[new_matrix] = place_diag(old_matrix, diagonal_element);
%
%
% Function function to place the desired number along the diagonal of a matrix
%
%
%
%	Inputs:
%				old_matrix				matrix to be manipulated
%				diaganol_element		element to be place along the diagonal
%
%	Outputs:
%				new_matrix				matrix witrh the desired element along the diag.

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	place_diag.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to place a desired number along the diagonal of a matrix.	*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************



diag_matrix = diag(diagonal_element*ones(length(old_matrix),1));

new_matrix = tril(old_matrix,-1) + triu(old_matrix,1) + diag_matrix;
