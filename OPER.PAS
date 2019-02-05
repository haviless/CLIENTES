function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  
  if trim(Expression)= '' then Exit;

  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try

    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);

      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;

      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;
      
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

      Aggregates.Clear;

    end;

    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);

  finally
    cdsClone.Free;
  end;
end;
