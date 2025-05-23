clc;
clear;
close all;

% Root directory containing multiple subfolders
root_dir = 'D:\Code\MTP\Nelora\NELoRa-Sensys\symbol_generation\output\LoRa_db\ins1';

% Get list of all subdirectories in 'ins1'
dir_list = dir(root_dir);
dir_list = dir_list([dir_list.isdir]); % Keep only directories
dir_list = dir_list(~ismember({dir_list.name}, {'.', '..'})); % Remove . and ..

% Loop through each subfolder
for i = 1:length(dir_list)
    folder_name = dir_list(i).name;
    subfolder = fullfile(root_dir, folder_name);
    wCFO_folder = fullfile(subfolder, 'woCFO');

    % Check if wCFO folder exists
    if exist(wCFO_folder, 'dir')
        % Get list of all files in wCFO folder
        file_list = dir(fullfile(wCFO_folder, '*'));
        file_list = file_list(~[file_list.isdir]); % Exclude directories

        % Move each file to the parent folder
        for j = 1:length(file_list)
            src = fullfile(wCFO_folder, file_list(j).name);
            dst = fullfile(subfolder, file_list(j).name);
            movefile(src, dst);
            fprintf('Moved: %s -> %s\n', src, dst);
        end
    end
end

fprintf('All files moved from wCFO folders to their parent folders.\n');
