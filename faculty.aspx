<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="faculty.aspx.cs" Inherits="ClubManagementSystem.faculty" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Dashboard</title>
    <style type="text/css">
        /* General Page Styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            height: 100%; /* Ensure the page height is 100% */
            background-color: #f4f4f4; /* Add a background color for better contrast */
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color:#4169E1;
            color: white;
            padding-top: 20px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            overflow: auto; /* Make sidebar scrollable if the content overflows */
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 260px;  /* Account for sidebar */
            padding: 20px;
            width: calc(100% - 260px); /* Ensure the content area takes up the rest of the space */
            height: 100hv; /* Ensure main content takes full height */
            overflow: auto; /* Allow scrolling within content area if needed */
            
        }

        /* Content Sections */
        .content-section {
            display: block; /* Show all sections by default */
        }

        /* Full-Width Tables */
        table {
            width: 100%;
            border-collapse: collapse; /* Collapse borders to make the table cleaner */
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #006699;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Add space between table rows */
        tr {
            height: 40px;
        }

        /* Ensure the label in the account section takes up full width */
        #accountSection table td {
            width: 100%;
            padding: 12px;
        }
    </style>

    <script type="text/javascript">
        // Function to toggle visibility of the content sections based on menu selection
        function showContent(sectionId) {
            var sections = document.getElementsByClassName('content-section');
            // Hide all sections
            for (var i = 0; i < sections.length; i++) {
                sections[i].style.display = 'none';
            }
            // Show the selected section
            document.getElementById(sectionId).style.display = 'block';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="javascript:void(0);" onclick="showContent('facultySection')">Faculty Coordinators Details</a>
            <a href="javascript:void(0);" onclick="showContent('membersSection')">Club Members</a>
            <a href="javascript:void(0);" onclick="showContent('accountSection')">Account</a>
            <a href="javascript:void(0);" onclick="showContent('Applications')">View Applications</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Faculty Coordinators Section -->
            <div id="facultySection" class="content-section">
                <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td colspan="2" align="center" bgcolor="#CCC1B0">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="NeoSans" Font-Size="Large" Text="Faculty Coordinators"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td colspan="9" align="center" bgcolor="#FFFFFF">
                            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Names="Calibri" Font-Size="Small" Visible="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="Fac_id" ItemStyle-Width="60" HeaderText="Fac_id" SortExpression="Fac_id" />
                                    <asp:BoundField DataField="Fac_Name" HeaderText="Fac_Name" SortExpression="Fac_Name" />
                                    <asp:BoundField DataField="Fac_MobileNum" HeaderText="Fac_MobileNum" SortExpression="Fac_MobileNum" />
                                    <asp:BoundField DataField="Fac_Mail" HeaderText="Fac_Mail" SortExpression="Fac_Mail" />
                                    <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" />
                                    <asp:BoundField DataField="Club_id" HeaderText="Club_id" SortExpression="Club_id" />
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cmsConnectionString %>" SelectCommand="select * from Fac_Master where Club_id=(select Club_id from Fac_Master where Fac_id = @User_name)">
                                <SelectParameters>
                                    <asp:SessionParameter DbType="String" Name="User_name" SessionField="username" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Club Members Section -->
            <div id="membersSection" class="content-section">
                <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td colspan="2" align="center" bgcolor="#CCC1B0">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="NeoSans" Font-Size="Large" Text="Club Members"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td colspan="9" align="center" bgcolor="#FFFFFF">
                            <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" Font-Names="Calibri" Font-Size="Small" DataKeyNames="Cid">
                                <Columns>
                                    <asp:BoundField DataField="Cid" ItemStyle-Width="60" HeaderText="Cid" SortExpression="Cid" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="Reg_no" HeaderText="Reg_no" SortExpression="Reg_no" />
                                    <asp:BoundField DataField="Stud_Name" HeaderText="Stud_Name" SortExpression="Stud_Name" />
                                    <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
                                    <asp:BoundField DataField="Stud_Mail" HeaderText="Stud_Mail" SortExpression="Stud_Mail" />
                                    <asp:BoundField DataField="Stype" HeaderText="Stype" SortExpression="Stype" />
                                    <asp:BoundField DataField="Stud_Bg" HeaderText="Stud_Bg" SortExpression="Stud_Bg" />
                                    <asp:BoundField DataField="Clubid" HeaderText="Clubid" SortExpression="Clubid" />
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cmsConnectionString %>" SelectCommand="select * from Stud_Master where Clubid=(select Club_id from Fac_Master where Fac_id = @User_name)">
                                <SelectParameters>
                                    <asp:SessionParameter DbType="String" Name="User_name" SessionField="username" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Account Section -->
            <div id="accountSection" class="content-section">
                <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td colspan="2" align="center" bgcolor="#CCC1B0">
                            <asp:Label ID="LabelAccount" runat="server" Font-Bold="True" Font-Names="NeoSans" Font-Size="Large" Text="Account Details"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td>User Name: <asp:Label ID="LabelUserName" runat="server" Text="FAC002"></asp:Label></td>
                        <td>Password: <asp:Label ID="LabelPassword" runat="server" Text="FAC"></asp:Label></td>
                    </tr>
                </table>
            </div>

            <!-- Applications Section -->
            <div id="Applications" class="content-section">
                <h3>View applications by clicking the link below:</h3>
                <a href="https://docs.google.com/spreadsheets/d/124c0Gdq8UUwzrwkTm1PuhFu8Tm17q3JSzCbORJ9R2RU/edit?resourcekey=&gid=1921725554#gid=1921725554"> APPLICANTS FOR THE CLUB </a>
            </div>

        </div>

    </form>
</body>
</html>
