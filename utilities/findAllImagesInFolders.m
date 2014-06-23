function images = findAllImagesInFolders(folderName,fileType,frontConstraint)
%finds all images within 'folderName' (recursively) whose names end in 
%'fileType' and start with 'frontConstraint

    if nargin==1
        fileType = '.tiff';
    end
    
    if nargin < 3 || isempty(frontConstraint) == 1
        frontConstraint = '';
    end
    
    
    if folderName(end) ~= '/'
        folderName = strcat(folderName, '/');
    end
    
    images = fuf([folderName frontConstraint '*' fileType],1,'details');
    imageLengths = returnCellLengths(images);
    images = images(imageLengths > length(fileType));
    
    
