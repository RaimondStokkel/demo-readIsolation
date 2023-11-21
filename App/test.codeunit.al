codeunit 50100 teser
{

    local procedure CurrentBehavior()
    var
        cust: Record Customer;
        otherCust: Record Customer;
        curr: Record Currency;
    begin
        cust.FindFirst(); // READUNCOMMITTED

        // Heighten isolation level for Customer table.
        cust.LockTable();

        cust.FindLast(); // UPDLOCK

        // Also impacts other instances of same table.
        otherCust.FindSet(); // UPDLOCK

        // But does not impact other tables.
        curr.Find(); // READUNCOMMITTED
    end;

    local procedure UsingReadIsolation()
    var
        cust: Record Customer;
        otherCust: Record Customer;
        curr: Record Currency;
    begin
        cust.FindFirst(); // READUNCOMMITTED

        // Heighten isolation level for Customer table.
        cust.LockTable();

        // Explicitly select another isolation level than the transaction's.
        otherCust.ReadIsolation := IsolationLevel::ReadUncommitted;

        otherCust.FindSet(); // READUNCOMMITED
    end;

    // Gets the next "Entry No." and locks just last row.
    // Without causing the rest of transaction to begin taking locks.
    local procedure GetNextEntryNo(): Integer
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.ReadIsolation := IsolationLevel::UpdLock;
        GLEntry.FindLast();
        exit(GLEntry."Entry No." + 1)
    end;

    local procedure GetEstimatedCount(tableno: Integer): Integer
    var
        rref: RecordRef;
    begin
        rref.Open(tableno);
        rref.ReadIsolation := IsolationLevel::ReadUncommitted;
        exit(rref.Count);
    end;

}