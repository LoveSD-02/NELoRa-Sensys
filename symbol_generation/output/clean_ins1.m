clc;
clear;
close all;

% Root folder containing multiple subfolders
root_dir = 'D:\Code\MTP\Nelora\NELoRa-Sensys\symbol_generation\output\LoRa_db\ins1';

% Get list of all subdirectories in 'ins1'
dir_list = dir(root_dir);
dir_list = dir_list([dir_list.isdir]); % Keep only directories
dir_list = dir_list(~ismember({dir_list.name}, {'.', '..'})); % Remove . and ..

% Loop through each subdirectory
for i = 1:length(dir_list)
    folder_name = dir_list(i).name;
    subfolder = fullfile(root_dir, folder_name);
    
    % Define full paths to target items
    woCFO_folder = fullfile(subfolder, 'wCFO');
    wCFO_csv = fullfile(subfolder, [folder_name, '_wCFO.csv']);
    woCFO_csv = fullfile(subfolder, [folder_name, '_woCFO.csv']);
    
    % Delete woCFO folder if it exists
    if exist(woCFO_folder, 'dir')
        fprintf('Deleting folder: %s\n', woCFO_folder);
        rmdir(woCFO_folder, 's');
    end

    % Delete <folder_name>_wCFO.csv if it exists
    if exist(wCFO_csv, 'file')
        fprintf('Deleting file: %s\n', wCFO_csv);
        delete(wCFO_csv);
    end

    % Delete <folder_name>_woCFO.csv if it exists
    if exist(woCFO_csv, 'file')
        fprintf('Deleting file: %s\n', woCFO_csv);
        delete(woCFO_csv);
    end
end

fprintf('Cleanup complete.\n');
