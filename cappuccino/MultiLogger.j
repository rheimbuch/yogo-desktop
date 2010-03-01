MultiLogger = function()
{
    var loggers = [];
    for(var i=0; i<arguments.length; i++)
    {
        loggers.push(arguments[i]);
    }
    
    if(loggers.length === 0)
        loggers.push(CPLogConsole);
    
    var logger = function(message,level,title)
    {
        for(var i=0; i<loggers.length; i++)
        {
            loggers[i](message,level,title);
        }
    }
    
    return logger;
};