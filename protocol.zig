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
