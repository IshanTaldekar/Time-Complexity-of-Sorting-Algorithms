% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Time Complexity Visualization 
% 
% Program name: visualize_results
%
% Author: ishantaldekar1@gmail.com
%
% Date created: October 15, 2018
% 
% Purpose: To plot the time complexity data generated.
%
% Revision history: 
% 
% Date  Author  Ref  Revision
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function visualize_results(bubble_sort_time, counting_sort_time, insertion_sort_time, quick_sort_time, merge_sort_time)

figure,

plot(bubble_sort_time(:, 1), bubble_sort_time(:, 2), 'r--o');
grid on;
hold on;
title('Time Complexity of Sorting Algorithms');
xlabel('input size');
ylabel('time');

plot(counting_sort_time(:, 1), counting_sort_time(:, 2), 'g--o');
plot(insertion_sort_time(:, 1), insertion_sort_time(:, 2), 'b--o');
plot(quick_sort_time(:, 1), quick_sort_time(:, 2), 'c--o');
plot(merge_sort_time(:, 1), merge_sort_time(:, 2), 'm--o');

legend({'Bubble Sort', 'Counting Sort', 'Insertion Sort', 'Quick Sort', 'Merge Sort'}, 'location', 'northwest');

end