<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="sms_api_asp.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--    <link href="src/css/bootstrap.min.css" rel="stylesheet" />
    <script src="src/js/bootstrap.min.js"></script>--%>
    <style>
        .row1 {
            width: 100%;
            display:inline-block;
        }
        .box {
            border:dashed 3px red;
            z-index: 1;
            left: 10px;
            top: 101px;
            position: absolute;
            height: 60px;
            width: 1425px;
        }
    </style>
</head>
<body class="container">
    <form id="form1" runat="server">
    <div class="row">
        <asp:Label ID="Label1"  runat="server" Text="Your Api Key" style="z-index: 1; left: 10px; top: 16px; position: absolute"></asp:Label>
        <asp:TextBox ID="ApiKeyTxt" runat="server" style="z-index: 1; left: 157px; top: 18px; position: absolute; width: 351px">sa659126429:mLumyhIpZsDYyIo1PNhiPq9O0UpdZiOYoE6q</asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="Label2" runat="server" Text="Your Gateway" style="z-index: 1; left: 10px; top: 50px; position: absolute"></asp:Label>
        <asp:TextBox ID="GatewayTxt"  runat="server" style="z-index: 1; left: 157px; top: 53px; position: absolute; width: 356px">10009398238801</asp:TextBox>
    </div>
    <div class="box"> 
        <div class="row">
            <asp:Button ID="Button1" runat="server" Text="Get Balance" Width="137px" OnClick="Button1_Click" style="z-index: 1; left: 28px; top: 18px; position: absolute" />
        </div>
    </div>
    <div>
        <asp:TextBox ID="StatusCodeTxt" runat="server" style="z-index: 1; left: 185px; top: 665px; position: absolute; width: 735px"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 68px; top: 660px; position: absolute" Text="Status Code"></asp:Label>
        <asp:TextBox ID="MessageTxt" runat="server" style="z-index: 1; left: 185px; top: 707px; position: absolute; width: 735px"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 87px; top: 708px; position: absolute; bottom: 163px" Text="Message"></asp:Label>
        <asp:TextBox ID="ResultTxt" runat="server" style="z-index: 1; left: 184px; top: 753px; position: absolute; width: 734px; height: 100px"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 109px; top: 749px; position: absolute" Text="Result"></asp:Label>
   </div>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="z-index: 1; left: 27px; top: 184px; position: absolute; width: 218px" Text="Send Single Or Group Sms" />
        <asp:TextBox ID="SingleGroupNumbersTxt" runat="server" style="z-index: 1; left: 735px; top: 182px; position: absolute; width: 451px"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 301px; top: 177px; position: absolute" Text="Your Numbers:example(09398238801,09175555555)"></asp:Label>
        <asp:Panel ID="Panel1" runat="server" BorderColor="#0066FF" BorderStyle="Groove" style="z-index: 0; left: 9px; top: 173px; position: absolute; height: 93px; width: 1387px">
            <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 625px; top: 45px; position: absolute" Text="Your Text"></asp:Label>
            <asp:TextBox ID="SingleGroupTextTxt" runat="server" style="z-index: 1; left: 722px; top: 42px; position: absolute; width: 449px; height: 35px"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" BorderColor="#9999FF" BorderStyle="Groove" style="z-index: 1; left: 9px; top: 282px; position: absolute; height: 42px; width: 1387px">
            <asp:Button ID="Button3" runat="server" Text="Get Smses" style="z-index: 1; left: 9px; top: 6px; position: absolute" Width="161px" OnClick="Button3_Click" />
            <asp:TextBox ID="FromDateTxt" runat="server" style="z-index: 1; left: 480px; top: 11px; position: absolute"></asp:TextBox>
            <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 190px; top: 1px; position: absolute" Text="From Date:Exapmle(1397/04/05)"></asp:Label>
            <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 666px; top: 3px; position: absolute; height: 34px; width: 340px" Text="To Date:Exapmle(1397/05/12)"></asp:Label>
            <asp:TextBox ID="ToDateTxt" runat="server" style="z-index: 1; left: 952px; top: 10px; position: absolute; width: 164px"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" BorderColor="#9933FF" BorderStyle="Ridge" style="z-index: 1; left: 10px; top: 353px; position: absolute; height: 72px; width: 1387px">
            <asp:Button ID="Button4" runat="server" Text="Add To Phonebook" OnClick="Button4_Click" style="z-index: 1; left: 17px; top: 27px; position: absolute; width: 154px" />
            <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 224px; top: 21px; position: absolute" Text="Group_id"></asp:Label>
            <asp:TextBox ID="GroupIdTxt" runat="server" style="z-index: 1; left: 307px; top: 26px; position: absolute"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 518px; top: 22px; position: absolute" Text="Number"></asp:Label>
            <asp:TextBox ID="PhonebookNumberTxt" runat="server" style="z-index: 1; left: 596px; top: 24px; position: absolute"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server" BorderColor="#9933FF" BorderStyle="Double" style="z-index: 1; left: 13px; top: 461px; position: absolute; height: 132px; width: 1387px">
            <asp:Button ID="Button5" runat="server" Text="Send Pair to Pair Sms" OnClick="Button5_Click" style="z-index: 1; left: 11px; top: 14px; position: absolute; width: 269px" />
            <asp:Label ID="Label12" runat="server" style="z-index: 1; left: 304px; top: 13px; position: absolute" Text="Numbers:example(09398238801,09399999999)"></asp:Label>
            <asp:TextBox ID="PairToPairNumbersTxt" runat="server" style="z-index: 1; left: 728px; top: 18px; position: absolute; width: 218px"></asp:TextBox>
            <asp:Label ID="Label13" runat="server" style="z-index: 1; left: 437px; top: 55px; position: absolute" Text="Your Textes:Example(text1,text2)"></asp:Label>
            <asp:TextBox ID="PairToPairTextTxt" runat="server" style="z-index: 1; left: 728px; top: 60px; position: absolute; width: 215px"></asp:TextBox>
        </asp:Panel>
    </form>
</body>
</html>
