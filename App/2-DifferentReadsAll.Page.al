page 50101 DifferentReadsAll
{
    Caption = 'DifferentReadsAll';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ModifyCustomerConfirm)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BlockedEnum: Enum "Customer Blocked";
                begin
                    //Modify the customer record
                    Rec.Blocked := BlockedEnum::All;
                    Rec.Modify(false);
                    if not Confirm('block customer?') then
                        Error('');
                end;
            }
            action(InsertCustomerConfirm)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    //Insert a new customer
                    Customer."No." := CopyStr(CreateGuid(), 1, MaxStrLen(Customer."No."));
                    Customer.Insert(false);
                    if not Confirm('Insert customer?') then
                        Error('');
                end;
            }
            action(LockCustomerConfirm)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BlockedEnum: Enum "Customer Blocked";
                    Customer: Record Customer;
                begin
                    //Lock the customer record
                    customer.LockTable();
                    Customer.FindSet();
                    if not Confirm('Lock customer?') then
                        Error('');

                end;
            }
            action(RepeatableReadConfirm)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BlockedEnum: Enum "Customer Blocked";
                    Customer: Record Customer;
                begin
                    Customer.ReadIsolation := IsolationLevel::RepeatableRead;
                    Customer.FindSet();
                    if not confirm('Repeatable read') then
                        Error('');
                    Message(Format(Customer.Blocked));
                end;
            }
            action(ReadCommitted)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BlockedEnum: Enum "Customer Blocked";
                    Customer: Record Customer;
                begin
                    Customer.ReadIsolation := IsolationLevel::ReadCommitted;
                    Customer.FindSet();
                    Message(Format(Customer.Blocked));
                end;
            }
            action(ReadUnCommitted)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BlockedEnum: Enum "Customer Blocked";
                    Customer: Record Customer;
                begin
                    Customer.ReadIsolation := IsolationLevel::ReadUnCommitted;
                    Customer.FindSet();
                    Message(Format(Customer.Blocked));
                end;
            }
        }
    }
}