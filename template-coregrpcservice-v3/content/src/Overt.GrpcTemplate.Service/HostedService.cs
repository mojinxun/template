﻿using Grpc.Core;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Overt.Core.Grpc;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using static Overt.GrpcTemplate.Service.Grpc.TemplateService;

namespace Overt.GrpcTemplate.Service
{
    public class HostedService : IHostedService
    {
        readonly ILogger _logger;
        readonly TemplateServiceBase _grpcServImpl;
        public HostedService(
            ILogger<HostedService> logger,
            TemplateServiceBase grpcService)
        {
            _logger = logger;
            _grpcServImpl = grpcService;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            return Task.Factory.StartNew(() =>
            {
                var channelOptions = new List<ChannelOption>()
                {
                     new ChannelOption(ChannelOptions.MaxReceiveMessageLength, int.MaxValue),
                     new ChannelOption(ChannelOptions.MaxSendMessageLength, int.MaxValue),
                };
                GrpcServiceManager.Start(BindService(_grpcServImpl), channelOptions: channelOptions, whenException: (ex) =>
                {
                    _logger.LogError(ex, $"{typeof(HostedService).Namespace.Replace(".", "")}开启失败");
                    throw ex;
                });

                _logger.LogInformation($"{nameof(Overt.GrpcTemplate.Service).Replace(".", "")}开启成功");
            }, cancellationToken);
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.Factory.StartNew(() =>
            {
                GrpcServiceManager.Stop();

                _logger.LogInformation($"{typeof(HostedService).Namespace.Replace(".", "")}停止成功");
            }, cancellationToken);
        }
    }
}
