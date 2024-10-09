function output = ArrenbergInitTcpClient(ip_adress, port)
    global ArrenbergTcpClient;
    
    % init tcp client
    if ~ArrenbergTcpClient.connection_status
        ArrenbergTcpClient.tcp_connection = tcpclient(ip_adress, port);
        ArrenbergTcpClient.connection_status = true;
        disp('ArrenbergClient connected')
        fprintf('ArrenbergClient successfully connected to IP adress %s on port %s.\n', ip_adress, int2str(port));
        output = true;
    else
        disp('ERROR: ArrenbergClient already connected.');
        output = false;
    end
end