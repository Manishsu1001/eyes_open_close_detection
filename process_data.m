function [A,k] = process_data(myFolder, m, n, p)
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
A=zeros(length(jpegFiles),m*n*p);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  B=imresize(imageArray,[m n]); 
  size(B)
  if(1)
  end
 A(k,:)=reshape(B,1,m*n*p);
end
 size(A)
