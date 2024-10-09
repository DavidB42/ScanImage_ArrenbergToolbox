function ArrenbergInitTcpConnEnv(source, event, arguments)

    global ArrenbergTcpClient;

    % load test image
    t = Tiff('test_00001.tif','r');

    %setup the tcp client
    ArrenbergTcpClient = struct;
    ArrenbergTcpClient.test_tiff_image= read(t);
    ArrenbergTcpClient.connection_status = false;
    ArrenbergTcpClient.tcp_connection = [];
    ArrenbergTcpClient.toolbox_ui = ArrenbergToolboxUI();

    disp('Arrenberg TCP Environment set up.');

end