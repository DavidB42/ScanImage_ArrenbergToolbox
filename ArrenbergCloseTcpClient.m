function output = ArrenbergCloseTcpClient()

    global ArrenbergTcpClient;

    if ArrenbergTcpClient.connection_status
        
        % communication code for closing the tcp connection
        com_code_disconnected = int64([-1, 0]);
        com_code_disconnected_bytes = typecast(com_code_disconnected, 'uint8');

        % send code
        ArrenbergTcpClient.tcp_connection.write(com_code_disconnected_bytes);

        % delete tcp client object
        ArrenbergTcpClient = rmfield(ArrenbergTcpClient, 'tcp_connection');
        ArrenbergTcpClient.tcp_connection = [];
        ArrenbergTcpClient.connection_status = false;
    
        disp('Arrenberg TCP connection successfully closed.');
        output = true;
    else
        disp('ERROR: Cannot close non-existent connection.');
        output = false;
    end

end