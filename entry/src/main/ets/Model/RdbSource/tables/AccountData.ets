interface AccountData{
  id?: number;
  sender_type: string;
  context: string;
  time: string;
}

interface AccountTable{
  tableName: string;
  sqlCreate: string;
  columns: string[];
}

export {AccountData,AccountTable}