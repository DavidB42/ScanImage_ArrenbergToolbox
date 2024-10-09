function ArrenbergDisposeTcpConnEnv(source,event,arguments)
    global ArrenbergTcpClient;

    % dispose TCP environment
    ArrenbergCloseTcpClient();
    ArrenbergTcpClient.toolbox_ui.delete;

    disp('Arrenberg Toolbox disposed.');
end