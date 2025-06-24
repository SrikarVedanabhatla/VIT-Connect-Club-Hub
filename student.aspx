<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="ClubManagementSystem.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Clubs</title>
    <style>
        /* Basic styling for the layout */
        body {
            font-family: Calibri, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color:lightyellow
        }

        /* Sidebar menu styles */
        #sideMenu {
            width: 250px;
            background-color:#4169E1;
            color: white;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            left: 0;
            top: 0;
            padding-left: 20px;
        }

        #sideMenu h2 {
            color: #fff;
            font-size: 20px;
            margin-bottom: 20px;
        }

        #sideMenu a {
            display: block;
            padding: 10px;
            color: #ddd;
            text-decoration: none;
            font-size: 16px;
            margin-bottom: 10px;
        }

        #sideMenu a:hover {
            background-color: #575757;
            color: white;
        }

        /* Main content area */
        #content {
            margin-left: 270px;
            padding: 20px;
            width: 100%;
        }

        .grid-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
    </style>
</head>
<body>
    <!-- Sidebar menu -->
    <div id="sideMenu">
        <h2>Menu</h2>
        <a href="#studentClubs" onclick="showSection('studentClubs')">Student Club Membership</a>
        <a href="#facultyDetails" onclick="showSection('facultyDetails')">Faculty Members Details</a>
        <a href="#accountDetails" onclick="showSection('accountDetails')">Account Details</a>
        <a href="#clubApplications" onclick="showSection('clubApplications')">Club Application Forms</a>
    </div>

    <!-- Main Content -->
    <div id="content">
        <form id="form1" runat="server">
            <div class="grid-container">
                <!-- Student Clubs Section -->
                <div id="studentClubs" class="content-section">
                    <h2>Student Club Memberships</h2>
                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Names="Calibri" Font-Size="Small">
                        <Columns>
                            <asp:BoundField DataField="Clubid" ItemStyle-Width="60" HeaderText="Clubid" SortExpression="Clubid" />
                            <asp:BoundField DataField="Club_Name" HeaderText="Club_Name" SortExpression="Club_Name" />
                            <asp:BoundField DataField="Club_Desc" HeaderText="Club_Desc" SortExpression="Club_Desc" />
                            <asp:BoundField DataField="Club_start_date" HeaderText="Club_start_date" SortExpression="Club_start_date" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cmsConnectionString %>" SelectCommand="SELECT [Clubid], [Club_Name], [Club_Desc], [Club_start_date] FROM [Student_Club_Details] WHERE ([Reg_no] = @Reg_no)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Reg_no" SessionField="username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <!-- Faculty Details Section -->
                <div id="facultyDetails" class="content-section" style="display:none;">
                    <h2>Faculty Coordinators</h2>
                    <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" Font-Names="Calibri" Font-Size="Small">
                        <Columns>
                            <asp:BoundField DataField="ClubId" ItemStyle-Width="60" HeaderText="ClubId" SortExpression="ClubId" />
                            <asp:BoundField DataField="Club_Name" HeaderText="Club_Name" SortExpression="Club_Name" />
                            <asp:BoundField DataField="Fac_Name" HeaderText="Fac_Name" SortExpression="Fac_Name" />
                            <asp:BoundField DataField="Fac_MobileNum" HeaderText="Fac_MobileNum" SortExpression="Fac_MobileNum" />
                            <asp:BoundField DataField="Fac_Mail" HeaderText="Fac_Mail" SortExpression="Fac_Mail" />
                            <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cmsConnectionString %>" SelectCommand="SELECT [ClubId], [Club_Name], [Fac_Name], [Fac_MobileNum], [Fac_Mail], [School] FROM [Student_Club_Faculty] WHERE ([Reg_no] = @Reg_no)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Reg_no" SessionField="username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <!-- Account Details Section -->
                <div id="accountDetails" class="content-section" style="display:none;">
                    <h2>Account Details</h2>
                     </table>
                <table width="80%" border="1" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td>User Name: <asp:Label ID="LabelUserName" runat="server" Text="20BCE001"></asp:Label></td>
                        <td>Password: <asp:Label ID="LabelPassword" runat="server" Text="Stud"></asp:Label></td>
                    </tr>
                </table>
                    <!-- Add relevant controls for Account Details here -->
                </div>

                <!-- Club Application Forms Section -->
                <div id="clubApplications" class="content-section" style="display:none;">
                    <h2>Club Application Forms</h2>
                    <h3>BIONARY CLUB :</h3> <a href ="https://forms.gle/7U3vbyDkDnQMDSQK7"> Recuritment form</a> 
                                              
                    <!-- Add relevant controls for Club Applications here -->
                </div>
            </div>
        </form>
    </div>

    <script>
        // JavaScript to toggle visibility of sections
        function showSection(sectionId) {
            // Hide all sections
            const sections = document.querySelectorAll('.content-section');
            sections.forEach(section => section.style.display = 'none');

            // Show the selected section
            document.getElementById(sectionId).style.display = 'block';
        }

        // Initially show the first section (Student Club Membership)
        showSection('studentClubs');
    </script>
</body>
</html>
