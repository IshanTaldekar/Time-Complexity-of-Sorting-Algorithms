% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Project: Time Complexity Visualization
% 
% Program name: compute_time_complexity
%
% Author: ishantaldekar1@gmail.com
%
% Date created: October 15, 2018
% 
% Purpose: To generate time complexity data for various sorting algorithms.
%
% Revision history: 
% 
% Date  Author  Ref  Revision
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function compute_time_complexity()
    % Vectors will store the input size and the time taken by each specific
    % algorithm
    bubble_sort_time = [];
    insertion_sort_time = [];
    counting_sort_time = [];
    quick_sort_time = [];
    merge_sort_time = [];
    
for i = 1000:1000:15000    
    % Generating random i-element vectors to test sorting algorithms with
    input_array = randi(1000, [i 1]);
    
    [f1, f2, f3, f4, f5] = sorting_algorithms(input_array);
    
    % timeit function returns the time taken by a function
    bubble_sort_time = [bubble_sort_time; [i timeit(f1)]]
    insertion_sort_time = [insertion_sort_time; [i timeit(f2)]]
    counting_sort_time = [counting_sort_time; [i timeit(f3)]]
    quick_sort_time = [quick_sort_time; [i timeit(f4)]]
    merge_sort_time = [merge_sort_time; [i timeit(f5)]]
end

visualize_results(bubble_sort_time, counting_sort_time, insertion_sort_time, quick_sort_time, merge_sort_time);

end


