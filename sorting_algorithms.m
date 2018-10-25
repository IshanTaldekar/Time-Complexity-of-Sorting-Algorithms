% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Time Complexity Visualization 
% 
% Program name: sorting_algorithms.m
%
% Author: ishantaldekar1@gmail.com
%
% Date created: October 15, 2018
% 
% Purpose: Implementations of recursive bubble sort, insertion sort, quick
% sort, counting sort and merge sort algorithms.
%
% Revision history: 
% 
% Date  Author  Ref  Revision
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The function below is a standard, recursive implementations of a sorting 
% algorithm. Since the sorting algorithm has been implemented based on 
% psuedo-code (from the textbook) and the variable naming in these module
% is very descriptive, I wont be adding any comments to the sections below.
% Please refer to the psuedo-code for the algorithm incase something in
% this sections is unclear.

function [f1, f2, f3, f4, f5] = sorting_algorithms(input_array)
f1 = @() bubble_sort(input_array);
f2 = @() insertion_sort(input_array);
f3 = @() counting_sort(input_array, 1000);
f4 = @() quick_sort(input_array);
f5 = @() merge_sort(input_array);    
end

function sorted_array = bubble_sort(input_array)
input_size = size(input_array, 1);
if input_size < 2
    sorted_array = input_array;
    return;
end

for i = 1:input_size -1
    if (input_array(i) > input_array(i+1))
        temp = input_array(i);
        input_array(i) = input_array(i + 1);
        input_array(i+1) = temp;
    end
end
sorted_array = bubble_sort(input_array(1:input_size-1));
sorted_array = [sorted_array input_array(input_size)];
end

function sorted_array = insertion_sort(input_array)
input_size = size(input_array, 1);
for i = 2:input_size
    j = i - 1;
    index = i;
    
    while(j >= 1)
        if(input_array(index) < input_array(j))
            temp = input_array(j);
            input_array(j) = input_array(index);
            input_array(index) = temp;
            index = j;
        end
   
        j = j - 1;
    end
end
sorted_array = input_array;
end

function sorted_array = counting_sort(input_array, upper_bound_max)
input_size = numel(input_array);
new_array = zeros(upper_bound_max, 1);
for j = 1:input_size
    new_array(input_array(j)) = new_array(input_array(j)) + 1;
end
for i = 2:upper_bound_max
    new_array(i) = new_array(i) + new_array(i-1);
end
sorted_array = nan(input_size, 1);
for j = input_size:-1:1
    sorted_array(new_array(input_array(j))) = input_array(j);
    new_array(input_array(j)) = new_array(input_array(j)) - 1;
end
end

function sorted_array = quick_sort(input_array)
input_size = size(input_array, 1);
if input_size < 2
    sorted_array = input_array;
    return
end
split_input_array1 = [];
split_input_array2 = [];

for i = 1:input_size-1
    if input_array(i) < input_array(input_size)
        split_input_array1 = [split_input_array1 input_array(i)];
    else 
        split_input_array2 = [split_input_array2 input_array(i)];
    end
end
sorted_array = [quick_sort(split_input_array1) input_array(input_size) quick_sort(split_input_array2)];
end

function sorted_array = merge_sort(input_array)
input_size = size(input_array, 1);

if(input_size < 2)
    sorted_array = input_array;
    return;
end

mid = int32(input_size/2);
split_input_array1 = merge_sort(input_array(1:mid));
split_input_array2 = merge_sort(input_array(mid+1:input_size));
split_input_array1_size = size(split_input_array1, 1);
split_input_array2_size = size(split_input_array2, 1);

count1 = 1;
count2 = 1;

sorted_array = [];

while(count1 <= split_input_array1_size)
    if(count2 > split_input_array2_size)
        sorted_array = [sorted_array split_input_array1(count1)];
        count1 = count1 + 1;
        continue;
    end
    
    if(split_input_array1(count1) < split_input_array2(count2))
        sorted_array = [sorted_array split_input_array1(count1)];
        count1 = count1 + 1;
    else
        sorted_array = [sorted_array split_input_array2(count2)];
        count2 = count2 + 1;
    end 
    
    for j = count2:split_input_array2_size
        sorted_array = [sorted_array input_array(j)];
    end
end
end