function [ReturnSample]=GenerateReturnIndex( )
logReturnSample=GenerateLogReturnIndex( );
ReturnSample=exp(logReturnSample);
end