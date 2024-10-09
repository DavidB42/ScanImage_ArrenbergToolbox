function ArrenbergSendAcquisitionMetadata(acqu_mode, source,event)
    global ArrenbergTcpClient;

    if ~ArrenbergTcpClient.connection_status
        return
    end
    
    % create meta data as struct
    meta_data = struct();

    % add acquisition mode
    meta_data.acquisition_mode = acqu_mode;
    
    % add rolling average factor
    if (~isempty(source.hSI.hDisplay.displayRollingAverageFactor)); meta_data.rolling_avg_factor = source.hSI.hDisplay.displayRollingAverageFactor; end

    % add number of slices in stack
    if (~isempty(source.hSI.hStackManager.numSlices)); meta_data.stack_num_slices = source.hSI.hStackManager.numSlices; end

    % add start position of stack
    if (~isempty(source.hSI.hStackManager.stackZStartPos)); meta_data.stack_z_start_pos = source.hSI.hStackManager.stackZStartPos; end

    % add end position of stack
    if (~isempty(source.hSI.hStackManager.stackZEndPos)); meta_data.stack_z_stop_pos = source.hSI.hStackManager.stackZEndPos; end

    % add number of frames per volume in stack
    if (~isempty(source.hSI.hStackManager.numFramesPerVolume)); meta_data.stack_num_frames_per_volume = source.hSI.hStackManager.numFramesPerVolume; end

    % add data type of frames
    if (~isempty(source.hSI.hScan_ImagingScanner.channelsDataType)); meta_data.channels_data_type = source.hSI.hScan_ImagingScanner.channelsDataType; end
    
    % decode meta data to json and to bytes
    meta_data = jsonencode(meta_data);
    meta_data_bytes = uint8(meta_data);

    % create communication code
    com_code_meta_data = int64([10, length(meta_data)]);
    com_code_meta_data_bytes = typecast(com_code_meta_data, 'uint8');

    % create final message
    msg = [com_code_meta_data_bytes, meta_data_bytes];

    % send message
    ArrenbergTcpClient.tcp_connection.write(msg);

end