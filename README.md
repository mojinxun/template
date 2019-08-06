# Template

<a name="gn3gvm"></a>
### [](#gn3gvm)1. GrpcServiceTemplate

> Դ���ַ��[https://github.com/mojinxun/template.git](https://github.com/mojinxun/template.git)
> 
> identity��Overt.GrpcTemplate.Service v 1.0.0


<a name="q34oyk"></a>
#### [](#q34oyk)��1����װ
> dotnet new -i Overt.GrpcTemplate.Service


<a name="4pgrpu"></a>
#### [](#4pgrpu)��2���鿴
> dotnet new -l


![](https://cdn.nlark.com/yuque/0/2018/png/186782/1543211226316-9f933dbc-1d42-4137-ba6c-12521bf8c77c.png#width=827)

���Կ������� OvertCoreGrpcService��һ����ڣ������identityΪOvert.GrpcTemplate.Service

<a name="cnpnnb"></a>
#### [](#cnpnnb)��3��ж��
> dotnet new -u Overt.GrpcTemplate.Service


<a name="lxswcy"></a>
#### [](#lxswcy)��4��ʹ��
> 
> // ע�������ʹ��һ������鿴����
> dotnet new OvertCoreGrpcService -h
> 

![](https://cdn.nlark.com/yuque/0/2018/png/186782/1543211078199-939ca248-be1e-468e-a86d-b6465dcdfb39.png#width=827)


```csharp
-na: ���������ռ䣬[namespace].Service���м�Ĳ���
-s: �����protobuf�ļ��еķ������ƶ��壬����ΪӢ�ģ��������ַ�
-se: ��������������������ע�ᵽConsul�����ƣ��������ļ��е�Name��һ��Ϊ�������������ռ�ȥ���㣬Overt.Grpc.Service => OvertGrpcService
-p: ������������������ռ�õĶ˿ڣ��������ļ��е�Port

// ʾ��
dotnet new OvertCoreGrpcService -na Overt.GrpcTest -s GrpcTestService -se OvertGrpcTestService -p 10001
```


**���ս����**

![](https://cdn.nlark.com/yuque/0/2018/png/186782/1543215369051-523eddb4-091c-4c44-92c7-d4e51af361b1.png#width=703)

**ʹ��PowerShellִ��init.ps1�ļ����޸��ļ�������**




<a name="85knsx"></a>
### [](#85knsx)2. TemplateService

> Դ���ַ��[https://github.com/mojinxun/template.git](https://github.com/mojinxun/template.git)
> 
> identity��Overt.Template.Service v 1.0.0


<a name="06g7ih"></a>
#### [](#06g7ih)��1����װ
> dotnet new -i Overt.Template.Service


<a name="3awmsl"></a>
#### [](#3awmsl)��2���鿴
> dotnet new -l


![](https://cdn.nlark.com/yuque/0/2018/png/186782/1543211222374-e9cb9d24-654f-4531-ad7f-9202e171ed33.png#width=827)

���Կ������� OvertCoreService��һ����ڣ������identityΪOvert.Template.Service

<a name="8yihpd"></a>
#### [](#8yihpd)��3��ж��
> dotnet new -u Overt.Template.Service


<a name="4lxkpw"></a>
#### [](#4lxkpw)��4��ʹ��
> 
> // ע�������ʹ��һ������鿴����
> dotnet new OvertCoreService -h
> 

![](https://cdn.nlark.com/yuque/0/2018/png/186782/1543211288960-5ad2364b-4ab4-41fd-b494-3987df89494f.png#width=827)


```csharp
-na: ���������ռ䣬[namespace].Service���м�Ĳ���

// ʾ��
dotnet new OvertCoreService -na Overt.Test
```



**���ս����**

![](https://cdn.nlark.com/yuque/0/2018/png/186782/1543215445020-b54de14a-f267-4cb0-8754-bc694302125e.png#width=721)

**ʹ��PowerShellִ��init.ps1�ļ����޸��ļ�������**
