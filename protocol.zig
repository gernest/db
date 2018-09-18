pub const ProtocolVersion :i32 = 196608;
pub const SSLRequestCode  :i32 = 80877103;

pub const SSLAllowed    u8 = 'S'
pub const SSLNotAllowed u8 = 'N'

pub const AuthenticationMessageType  u8 = 'R'
pub const ErrorMessageType           u8 = 'E'
pub const EmptyQueryMessageType      u8 = 'I'
pub const DescribeMessageType        u8 = 'D'
pub const RowDescriptionMessageType  u8 = 'T'
pub const DataRowMessageType         u8 = 'D'
pub const QueryMessageType           u8 = 'Q'
pub const CommandCompleteMessageType u8 = 'C'
pub const TerminateMessageType       u8 = 'X'
pub const NoticeMessageType          u8 = 'N'
pub const PasswordMessageType        u8 = 'p'
pub const ReadyForQueryMessageType   u8 = 'Z'


pub const AuthenticationOk          i32 = 0;
pub const AuthenticationKerberosV5  i32 = 2;
pub const AuthenticationClearText   i32 = 3;
pub const AuthenticationMD5         i32 = 5;
pub const AuthenticationSCM         i32 = 6;
pub const AuthenticationGSS         i32 = 7;
pub const AuthenticationGSSContinue i32 = 8;
pub const AuthenticationSSPI        i32 = 9;