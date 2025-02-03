<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Certaining.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        .error1 {
            color: red;
        }

        .error {
            color: red;
        }

        .btn-time-select {
            border: 1px solid #2f3944;
            background: #e2e2e2;
            color: #2f3944;
            width: 71px;
            height: 30px;
            font-size: 13px;
            padding: 2px 4px;
            margin: 2px 0;
            border-radius: 6px
        }

            .btn-time-select:hover {
                border: 1px solid #76df3e;
                background: #fff;
                color: #2f8800
            }

        .btn-time-select-active {
            color: #2f8800;
            background: #fff;
            border: 1px solid #76df3e;
            width: 71px;
            height: 30px;
            font-size: 13px;
            padding: 2px 4px;
            margin: 2px 0;
            border-radius: 6px
        }

        #ui-datepicker-div {
            position: absolute !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #e5dada36; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/loader.gif" Style="position: fixed; top: 50%; width: 80px;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="up1" runat="server">
        <%-- <Triggers>
            <asp:PostBackTrigger ControlID="Btn_Save" />
            <asp:PostBackTrigger ControlID="btn_submit" />
            <asp:PostBackTrigger ControlID="RepCertificate" />
        </Triggers>--%>
        <ContentTemplate>
            <section class="admin-wrap">
                <div class="">
                    <!-----left side banner------->
                    <div class="sidebar" style="position: fixed; z-index: 1;">
                        <ul class="nav flex-column " style="padding-top: 7rem;">

                            <li class="nav-item" onclick="showActiveDiv('Dashboard')">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-house-door"></i>
                                    <span class="menu-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="showActiveDiv('Shedule_New_Exam')">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-laptop"></i>
                                    <span class="menu-text">Shedule New Exam</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="showActiveDiv('Re_Shedule_Exam')">
                                <a href="#" class="nav-link">
                                    <i class="bi bi-copy"></i>
                                    <span class="menu-text">Re-Shedule Exam</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="showActiveDiv('score_report')">
                                <a href="#" class="nav-link">
                                    <i class="bi bi-award"></i>
                                    <span class="menu-text">Certificate & Score Report </span>
                                </a>
                            </li>

                            <li class="nav-item" onclick="showActiveDiv('Change_password')">
                                <a href="#" class="nav-link">
                                    <i class="bi bi-key"></i>
                                    <span class="menu-text">Change Password </span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="showActiveDiv('support')">
                                <a href="#" class="nav-link">
                                    <i class="bi bi-exclamation-circle"></i>
                                    <span class="menu-text">Support</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="Logout" class="nav-link">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span class="menu-text">Logout</span>
                                </a>
                            </li>
                        </ul>

                        <div class="profile-section">
                            <div class="dropdown profile-info p-3">
                                <a href="#" class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="img/1.png" alt="Profile Picture" class="profile-pic rounded-circle me-2">
                                    <span class="menu-text" id="spName" runat="server"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end text-small shadow" aria-labelledby="dropdownUser1">
                                    <li><a class="dropdown-item" onclick="showActiveDiv('Dashboard')">View Profile</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="Logout">LogOut</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!---dashboard------>
                    <div class="content1 student-panel active" id="Dashboard" runat="server" clientidmode="Static">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <h1 class="heading">Dashboard
                                    </h1>
                                    <p class="pstyle">View the details of your latest exam along with its real-time status.  </p>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-7 col-md-7 col-sm-6 text-center pb-2">
                                    <div style="background-color: #2e3943; border-radius: 30px 30px 0px 0">
                                        <div class="tp-mission-tab-section">
                                            <nav class="d-flex justify-content-center">
                                                <div class="nav tp-mission-tab pt-5 pb-5 pr-2 ps-3 pe-3 d-flex  " id="nav-tab" role="tablist" style="justify-content: space-between;">
                                                    <div>
                                                        <button class="nav-links active p-4" style="background-color: #007388; border-radius: 22px;" id="nav-Mission-tab1" data-bs-toggle="tab" data-bs-target="#Mission" type="button" role="tab" aria-controls="nav-Mission-tab" aria-selected="true">
                                                            <span style="color: white;" class="pt-5">Upcoming Exam(<asp:Label ID="Lbl_schedulecount" runat="server" Text="0"></asp:Label>)</span>
                                                        </button>
                                                    </div>
                                                    <div>
                                                        <button class="nav-links p-4" style="background-color: #007388; border-radius: 22px;" id="nav-Vission-tab" data-bs-toggle="tab" data-bs-target="#Vission1" type="button" role="tab" aria-controls="nav-Vission-tab" aria-selected="true">
                                                            <span style="color: white;">Cancelled Exam(<asp:Label ID="Lbl_Cancelcount" runat="server" Text="0" ForeColor="White"></asp:Label>)</span>
                                                        </button>
                                                    </div>
                                                    <div>
                                                        <button class="nav-links p-4" style="background-color: #007388; border-radius: 22px;" id="nav-Goal-tab111" data-bs-toggle="tab" <%--data-bs-target="#Goal"--%> type="button" role="tab" aria-controls="nav-Goal-tab" aria-selected="true" onclick="showActiveDiv('score_report')">
                                                            <span style="color: white;">Score Report(<asp:Label ID="Lbl_countreport" runat="server" Text="0" ForeColor="White"></asp:Label>)</span>
                                                        </button>
                                                    </div>
                                                    <div class="text-center">
                                                        <button class="nav-links p-4" style="background-color: #007388; border-radius: 22px;" id="nav-Goal-tab11" data-bs-toggle="tab" <%--data-bs-target="#Marketing"--%> type="button" role="tab" aria-controls="nav-Goal-tab1" aria-selected="true" onclick="showActiveDiv('score_report')">
                                                            <span style="color: white;">Earned Certificate(<asp:Label ID="Lbl_countcertificate" runat="server" Text="0" ForeColor="White"></asp:Label>)</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </nav>
                                        </div>



                                        <div class="tp-mission-wrapper z-index-3"
                                            style="background-color: rgb(224, 224, 224);">
                                            <div class="row justify-content-center"></div>
                                            <div class="tab-content" id="nav-tabContent">
                                                <div class="tab-pane fade show active" id="Mission"
                                                    role="tabpanel"
                                                    aria-labelledby="nav-Mission-tab" tabindex="0">
                                                    <div class="row align-items-center">
                                                        <div class="col-xl-12 col-lg-12">
                                                            <div class="tpmission">
                                                                <div class="tpmission__info">
                                                                    <div class="table-responsive">
                                                                        <table class="table">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th scope="col">Exam Name</th>
                                                                                    <th scope="col">Reg Number</th>
                                                                                    <th scope="col">Exam Date</th>
                                                                                    <th scope="col"> Time </th>
                                                                                    <th scope="col"> Status </th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td scope="row">
                                                                                                <asp:Label ID="lbl_book_id" runat="server" Text='<%#Eval("book_id") %>' Visible="false" />
                                                                                                <%#Eval("exam_name") %>
                                                                                                <%--<img src="img/<%#Eval("ImageUrl") %>" alt="Cloud-computing Certifications" class="img-responsive mt-10">--%></td>
                                                                                            <td><%#Eval("aadhar_card") %></td>
                                                                                            <td><%#Eval("exam_date") %></td>
                                                                                            <td class="date">
                                                                                                <%#Eval("exam_time") %>
                                                                                            </td>
                                                                                            <td class="date">
                                                                                                <asp:Label ID="lbl_testing_exam_date111" runat="server" Text='<%#Eval("Examstatus").ToString()=="Waiting to get hold of" ? "Not Started" : "" %>' ForeColor='<%# (Eval("Examstatus").Equals("Waiting to get hold of")) ?  System.Drawing.Color.Red : System.Drawing.Color.Green %>' />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <tr id="trEmpty" runat="server" visible="false">
                                                                                            <td colspan="6" style="text-align: center;">No records found.</td>
                                                                                        </tr>

                                                                                    </FooterTemplate>
                                                                                </asp:Repeater>
                                                                            </tbody>

                                                                            <spacer></spacer>
                                                                        </table>
                                                                        <div id="dvNoRecords" runat="server" visible="false">
                                                                            No records are available.
                                                                        </div>
                                                                    </div>
                                                                    <%--<br>
                                                                    <br>
                                                                    <h4 class="title-skill">Upcoming Exam
                                                                    </h4>
                                                                    <ul
                                                                        style="list-style: disc; padding-left: 20px;">
                                                                        <li class="pb-1">No Exam
                                                                        </li>
                                                                    </ul>--%>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <%-- <div class="col-xl-6 col-lg-6">
                                                            <div class="tpmission__thumb">
                                                                <img
                                                                    src="assets/img/mission/mission-1.jpg" />
                                                                    
                                                            </div>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade " id="Vission"
                                                    role="tabpanel"
                                                    aria-labelledby="nav-Vission-tab" tabindex="0">
                                                    <div class="row align-items-center">
                                                        <div class="col-xl-12">
                                                            <div class="tpmission">
                                                                <div class="tpmission__info">
                                                                    <br>
                                                                    <br>
                                                                    <h4 class="title-skill">Cancelled Exam
                                                                    </h4>

                                                                    <ul
                                                                        style="list-style: disc; padding-left: 20px;">
                                                                        <li>No Cancelled Exam
                                                                        </li>
                                                                        <br>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <%-- <div class="col-xl-12">
                                                            <div class="tpmission__thumb">
                                                                <img
                                                                    src="assets/img/mission/mission-2.jpg"
                                                                    alt>
                                                            </div>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade " id="Goal"
                                                    role="tabpanel" aria-labelledby="nav-Goal-tab"
                                                    tabindex="0">
                                                    <div class="row align-items-center">
                                                        <div class="col-xl-12">
                                                            <div class="tpmission">
                                                                <div class="tpmission__info">
                                                                    <br>
                                                                    <br>
                                                                    <h4 class="title-skill">Score Report
                                                                    </h4>
                                                                    <!-- <h4 class="tp-mission-title">We inspire and help our customers</h4> -->
                                                                    <ul
                                                                        style="list-style: disc; padding-left: 20px;">
                                                                        <li>No Score Report </li>
                                                                        <br>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <%-- <div class="col-xl-6">
                                                            <div class="tpmission__thumb">
                                                                <img
                                                                    src="assets/img/mission/mission-4.jpg"
                                                                    alt>
                                                            </div>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade " id="Marketing"
                                                    role="tabpanel" aria-labelledby="nav-Goal-tab"
                                                    tabindex="0">
                                                    <div class="row align-items-center">
                                                        <div class="col-xl-12">
                                                            <div class="tpmission">
                                                                <div class="tpmission__info">
                                                                    <br>
                                                                    <br>
                                                                    <h4 class="title-skill">Earned Certificate
                                                                    </h4>
                                                                    <!-- <h4 class="tp-mission-title">We inspire and help our customers</h4> -->
                                                                    <ul
                                                                        style="list-style: disc; padding-left: 20px;">
                                                                        <li>No Earned Certificate  </li>
                                                                        <br>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <%--<div class="col-xl-6">
                                                            <div class="tpmission__thumb">
                                                                <img
                                                                    src="assets/img/mission/mission-4.jpg"
                                                                    alt>
                                                            </div>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-6">
                                    <div class="profile-box" style="border-radius: 30px; overflow: scroll;">
                                        <button class="nav-links pt-2 pb-2 pr-2 pl-4 m-3 active" style="background-color: #007388; width: 7rem; border-radius: 22px;" id="nav-Mission-tab2" data-bs-toggle="tab" data-bs-target="#Mission" type="button" role="tab" aria-controls="nav-Mission-tab" aria-selected="true">
                                            <span style="color: white;" class="pt-5">Profile </span>
                                        </button>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4">
                                                <div class="pro-img">
                                                    <%-- <img src="img/about/about-image.jpg" alt="" srcset="">--%>
                                                    <asp:Image ID="imgDashboard" runat="server" ClientIDMode="Static" />
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 ">
                                                <span style="display: flex;">
                                                    <p><strong>Candidate ID:</strong></p>
                                                    <p class="ms-1">
                                                        <asp:Label ID="lblDashboardID" runat="server"></asp:Label>
                                                    </p>
                                                </span>
                                                <span style="display: flex;">
                                                    <p><strong>Full Name:</strong></p>
                                                    <p class="ms-3">
                                                        <asp:Label ID="lblDashboardName" runat="server"></asp:Label>
                                                    </p>
                                                </span>
                                                <span style="display: flex;">
                                                    <p><strong>Mobile No:</strong></p>
                                                    <p class="ms-3">
                                                        <asp:Label ID="lblDashboardNumber" runat="server"></asp:Label>
                                                    </p>
                                                </span>
                                                <span style="display: flex;">
                                                    <p><strong>Email ID:</strong></p>
                                                    <p class="ms-3">
                                                        <asp:Label ID="lblDashboardEmail" runat="server"></asp:Label>
                                                    </p>
                                                </span>
                                                <span style="display: flex;">
                                                    <p><strong>Address:</strong></p>
                                                    <p class="ms-3">
                                                        <asp:Label ID="lblDashboardAddress" runat="server"></asp:Label>
                                                    </p>
                                                </span>

                                                <!-- <div class="row d-flex">
                                                <div class="col-lg-3 col-md-3 col-sm-3">
                                                    
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3">
                                                    
                                                </div>
                                            </div> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class=" mt-2 pe-2 ps-3 " style="border-radius: 30px; background: #fff; border: 1px solid #ccc;">
                                        <button class="nav-links pt-2 pb-2 pr-2 pl-4 m-3 active" style="background-color: #007388; width: 7rem; border-radius: 22px;" id="nav-Mission-tab" data-bs-toggle="tab" data-bs-target="#Mission" type="button" role="tab" aria-controls="nav-Mission-tab" aria-selected="true">
                                            <span style="color: white;" class="pt-5">POLICIES                                        </span>
                                        </button>
                                        <div class="accordion accordion-flush" id="accordionFlushExample">
                                            <div class="accordion-item" id="accordion-item-1">
                                                <h2 class="accordion-header" id="flush-headingOne">
                                                    <button class="accordion-button collapsed" style="background-color: #007388; color: white; border-radius: 20px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                                        Terms of Use
                                           
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body" style="overflow: auto; height: 90px;">
                                                        <p>
                                                            Please read all the terms & conditions carefully, before registering and using the services of certaining.org. The following Terms and conditions will be applicable to all the visitors, users and others who wish to access and use the services of Certainig.

                                                    By accepting these terms, you agree to be legally bound by the agreements whether or not you are a registered user.
                                                    
                                                    In case, you disagree with any part of these terms or our Privacy Policy, you should not use the Certainig Site.
                                                    
                                                    Candidates are requested to carefully read all the terms before they click on the “Agree” button while registering themselves for certain exams. Once a candidate agrees to the terms it would confirm their compliance towards the contract signed for following the exams rules.
                                                    
                                                    Our website provides certain links of other websites but we at Certainig do not endorse those websites.
                                                    
                                                    Certainig uses the services of third party for facilitating payment. By submitting their information, a candidate grants us the right to share their information with that third party subject to our privacy policy.
                                                    
                                                    Our website has developed certain protocols to analyse the authenticity of the information shared and to detect any kind of fraud. Any false information or a duplicate entry by the candidates will be rejected. In such a case, the amount submitted by the candidates might be forfeited and it might lead to the cancellation of the exam as well.
                                                    
                                                    By visiting and registering on our website a candidate agrees to receive communications from us in the form of agreements, notices, disclosures and other communications through email or by updating the information on the site.
                                                    
                                                    Exams are conducted under strict vigilance. Candidates shall carefully follow all instructions at the time of taking exams. Any violation of rules might result into cancellation of the exam. Certainig reserves the right to disqualify the candidate depending upon the situation.
                                                    
                                                    Certainig is not a body or an organization offering legal education and does not require any approval to conduct exams. Exams are held in a peaceful environment and under strict supervision. Any kind of disturbance from a Candidate might result in a strict action or cancellation of his/her exam.
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item" id="accordion-item-2">
                                                <h2 class="accordion-header" id="flush-headingTwo">
                                                    <button class="accordion-button collapsed" style="background-color: #05e7f9; color: black; border-radius: 20px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                                        Refund Policy
                                           
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body" style="overflow: auto; height: 90px;">
                                                        The refund percentages mentioned are in case of full fee payment and not just for any amount paid. Refund percentages will be applicable only in the case where complete fee of the product has been paid without any balance remaining

                                                    In a situation where, candidates card/bank gets debited multiple times due some technical error OR a situation where a candidate’s account is debited of an extra amount in a single transaction itself due some technical error, excess amount excluding the Payment Gateway charges would be refunded to the candidate.

                                                    In case a candidate’s account gets debited with the exam fee but the candidate does not gets enrolled for the exam due some technical error, the candidate will be provided the Examination ID by Certainig after proper verification, without any charges or extra cost. However, in such a case, if the candidate wishes to get the amount refunded then he/she will be refunded the net amount after deducting the payment gateway charges or any other charges, if any.

                                                    The registration will be processed manually and only after a thorough verification, if the claim is found valid, the amount that has been received in excess will be refunded by Certainig through the electronic mode in favour of the applicant.

                                                    The registration will be processed manually and only after a thorough verification, if the claim is found valid, the amount that has been received in excess will be refunded by Certainig through the electronic mode in favour of the applicant.

                                                    On receipt of such claims a confirmation will also be sent to the mailing address mentioned in the Online Registration Form, within a period of 7-10 calendar days.

                                                    Certainig has a zero tolerance policy in case of charge backs. Any customer who has a dispute in regards to a credit card payment that is found to be valid will permanently be blacklisted or barred from any kind of dealing with Certainig. Any past due fees and costs will be reported to all available Credit Reporting Agencies.

                                                    A client shall sincerely reveal all the details to Certainig about each and every case, existing or past, any case of wrong doing and/or conviction and insolvency levelled against the client or on those who are dependent on him. In case a client does not reveals all such details and any such thing is found later on, client will not be refunded any amount by Certainig.

                                                    If a candidate’s refund request falls under the acceptable terms and conditions of the Company and the service agreement, the time taken to process such a request will be 30 working days.
                                                
                                           
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item" id="accordion-item-3">
                                                <h2 class="accordion-header" id="flush-headingThree333">
                                                    <button class="accordion-button collapsed" style="background-color: #007388; color: white; border-radius: 20px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                                        Privacy Policy
                                           
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body " style="overflow: auto; height: 90px;">
                                                        Certainig substantiates the authenticity of the information provided on its website.

                                                Company reserves the right to change any information from time to time without prior notice. The changes could also be made due to technical errors or if any problem occurs.

                                                Any information shared by our clients and individuals will not be sold or exchanged with any third party without the client’s consent.

                                                Certainig does not indulge in any activity that damages the privacy of our clients. We collect information directly from our clients rather than relying upon any third party for gathering information of clients.

                                                In case, if at any point of time our clients feel that the information being provided by us is incorrect, they are free to contact us. Kindly contact us at info@certaining.org

                                                Our website may have links to other third party websites or services. Certainig does not control or own the privacy policies, practices or content of those third parties.

                                                As our client you must acknowledge and agree that Certainig shall not be held responsible in case of any damage or loss caused to you by any such third party services.

                                                Certainig will require your personal information like name, age, email, address, phone no, postal address and other details related to the examination for which you have registered. Once the client registers for the exam, Certainig will provide a password that strictly needs to be kept confidential by the client.

                                                Company will also require your personal details to administer, assess and develop examinations. Company shall not be held responsible if any details shared with us are false or inaccurate in any aspect.

                                                Cookies being used by Certainig are strictly in accordance with the law and have been created to enhance a user’s online experience and keep a track of the website’s performance.

                                                In the case of cookies being disabled by a user Certainig shall not be held responsible for any kind of error in the functioning of all the services and features on the website.    
                                           
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item" id="accordion-item-33">
                                                <h2 class="accordion-header" id="flush-headingThree3">
                                                    <button class="accordion-button collapsed" style="background-color: #05e7f9; color: black; border-radius: 20px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree1" aria-expanded="false" aria-controls="flush-collapseThree">
                                                        Cancellation Policy
                                             
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseThree1" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body " style="overflow: auto; height: 90px;">
                                                        Cancellations by Candidate:

                                                A candidate has an option of scheduling an exam either by visiting the Test Center directly or through the Certainig Site.
                                                
                                                If a candidate schedules an exam directly through the Test Center and in case, the candidate wants to cancel the exam, he/she needs to get it done through the Test Center only.
                                                
                                                The cancellation of the exam solely depends upon the reason being produced by the candidate.
                                                
                                                In the event of any cancellation of exam the candidate needs to produce a valid reason.
                                                
                                                Cancellation at the test center can take place even a minute before the start of the exam, if requested by the candidate.
                                                
                                                In such a case, no cancellation fee will be charged to the candidate, provided the reason given for cancellation is a valid one.
                                                
                                                However, in the case where an exam is scheduled online through the Certainig Site, the candidate can get the exam cancelled, if required, but only by contacting the Support Team.
                                                
                                                If an exam is booked online by the candidate, visiting a test center for cancellation of the exam will not help.
                                                
                                                For getting the exam cancelled without any charges, the candidate needs to contact the support team atleast 48 hrs before the test.
                                                
                                                In case the candidate fails to do so and requests for cancellation of the exam when less than 48hrs are left, a cancellation fee of 50$ will be charged and the remaining amount of the exam fee will be refunded to the candidate.
                                                
                                                Its mandatory for a candidate to provide a valid reason for getting his/her exam cancelled.
                                                
                                                Cancellations by Certainig:
                                                
                                                A candidate has an option of scheduling an exam either by visiting the Test Center directly or through the Certainig Site.
                                                
                                                Its mandatory for a candidate to provide a valid reason for getting his/her exam cancelled.
                                              
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item" id="accordion-item-333">
                                                <h2 class="accordion-header" id="flush-headingThree33">
                                                    <button class="accordion-button collapsed" style="background-color: #007388; color: white; border-radius: 20px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree3" aria-expanded="false" aria-controls="flush-collapseThree">
                                                        Re-Schedule Policy
                                             
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseThree3" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body " style="overflow: auto; height: 90px;">
                                                        Reschedule by Candidate:

                                                candidate has an option of rescheduling the exam either by visiting the Test Center directly or through the Certainig Site.

                                                If a candidate registers for an exam by visiting the Test Center and in case, the candidate wants to reschedule the exam, he/she needs to get it done through the Test Center only.

                                                The rescheduling of the exam solely depends upon the reason being produced by the candidate.

                                                In the event of rescheduling of an exam the candidate needs to produce a valid reason.

                                                Rescheduling can take place even a minute before the start of the exam, if requested by the candidate.

                                                In such a case, no fee will be charged to the candidate, provided the reason given for getting the exam rescheduled is a valid one.

                                                However, in the case where an exam is scheduled online through the Certainig Site, the candidate may get the exam rescheduled, if required, but only by contacting the Support Team.

                                                If an exam is booked online by the candidate, visiting a test center for rescheduling of the exam will not help

                                                The candidate needs to contact the support team atleast 48 hrs before the test.

                                                In case the candidate fails to do so and requests for rescheduling of the exam when less than 48hrs are left, a fee of 50$ will be charged for rescheduling./p>

                                                Its mandatory for a candidate to provide a valid reason for getting his/her exam rescheduled.

                                                Reschedule by Certainig:

                                                Certainig reserves the right to cancel or reschedule an exam at any time, including but not limited to insufficient registrations or unavailability of test center or due to unforeseen circumstances

                                                In such a case, candidates will not be charged anything for the future date allotted for the exam.
                                              
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>


                    </div>

                    <!----Shedule new Exam----->
                    <div class="content1 student-panel" id="Shedule_New_Exam" runat="server" clientidmode="Static">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <h1 class="heading" id="schedulenewexams" runat="server">Shedule New Exam</h1>
                                    <h1 class="heading" id="reschedulenewexams" runat="server" visible="false">Re-Schedule Exam</h1>
                                    <div class="card px-0  pb-0  mb-3">

                                        <p>Fill The Form Below to Shedule New Exam </p>

                                        <div class="msform">
                                            <ul id="progressbar">
                                                <li class="active" id="account" runat="server" clientidmode="Static"><strong>Fill Information </strong></li>
                                                <li id="exam" runat="server" clientidmode="Static"><strong>Select Exam</strong></li>
                                                <li id="review" runat="server" clientidmode="Static"><strong>Review Details </strong></li>
                                                <li id="payment" runat="server" clientidmode="Static"><strong>Payment  </strong></li>
                                            </ul>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="25" aria-valuemax="100"></div>
                                            </div>
                                            <br>

                                            <fieldset id="dvPersonalInformation" runat="server" clientidmode="Static">
                                                <div class="form-card">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <p>Personal Information (*) fields are required </p>
                                                        </div>
                                                        <div class="col-5">
                                                            <h2 class="steps">Step 1 - 4</h2>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">First Name:*</label>
                                                            <input id="txt_first_name" type="Text" name="text" placeholder="First Name" runat="server" />
                                                            <asp:RequiredFieldValidator Display="Dynamic" CssClass="error" ControlToValidate="txt_first_name" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4 ">
                                                            <label class="fieldlabels">Middle Name: </label>
                                                            <input id="txt_middle_name" type="text" name="text" placeholder="Middle Name" runat="server" />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label for="date" class="fieldlabels">Last Name: *</label>
                                                            <input id="txt_last_name" type="text" name="text" placeholder="Last Name" runat="server" />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4 ">
                                                            <div class="form-group">
                                                                <label for="" class="fieldlabels">Gender: *</label>
                                                                <asp:DropDownList ID="ddlGender" runat="server" class="form-control" ClientIDMode="Static">
                                                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator CssClass="error" ControlToValidate="ddlGender" InitialValue="0" runat="server" ErrorMessage="Required" Display="Dynamic" ValidationGroup="aac" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">DOB: *</label>
                                                            <input type="text" id="txt_DOB" class="form-control" placeholder="Enter DOB" runat="server" clientidmode="Static" />
                                                            <asp:RequiredFieldValidator CssClass="error" Display="Dynamic" ControlToValidate="txt_DOB" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <%-- <div class="col-lg-4 col-md-4 col-sm-4">
                                                        <label class="fieldlabels">Occupation: *</label>
                                                        <select class="form-control" id="ddCenterCountryd" onchange="toggleFields()">
                                                            <option value="-1" disabled selected>Occupation*</option>
                                                            <option value="-professional">Working Professional</option>
                                                            <option value="-student">Student</option>
                                                        </select>
                                                    </div>--%>

                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">Company Name:*</label>
                                                            <input type="text" id="txt_CompanyName" class="form-control" placeholder=" Enter Company Name" runat="server" clientidmode="Static" />
                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvCompanyName" CssClass="error" ControlToValidate="txt_CompanyName" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-2">
                                                            <label for="exampleFormControlSelect2">Designation:*</label>
                                                            <input type="text" id="txt_Designation" class="form-control" placeholder=" Enter Designation" runat="server" clientidmode="Static" />
                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDesignation" CssClass="error" ControlToValidate="txt_Designation" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <p>Contact Information (*) fields are required  </p>
                                                        <div class="col-lg-4 col-md-4 col-sm-2">
                                                            <div class="form-group">
                                                                <label for="" class="fieldlabels">Email: *</label>
                                                                <input type="text" id="txt_email" class="form-control" placeholder=" Enter Email ID *" runat="server" readonly="readonly" />
                                                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" CssClass="error" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ControlToValidate="txt_email" ValidationGroup="aac" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="error" ControlToValidate="txt_email" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-2">
                                                            <div class="form-group">
                                                                <label for="" class="fieldlabels">Mobile Number: *</label>
                                                                <input type="text" id="txt_mobile" class="form-control" placeholder=" Enter Mobile Number *" runat="server" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="15" />
                                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="error" ControlToValidate="txt_mobile" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-2">
                                                            <div class="form-group">
                                                                <label for="" class="fieldlabels">Phone Number: </label>
                                                                <input type="text" id="txt_phone" class="form-control" placeholder=" Enter Phone Number" runat="server" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="15" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">Current Address:*</label>
                                                            <textarea id="txt_address1" class="form-control" placeholder=" Enter Current Resident Address*" rows="2" runat="server"></textarea>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="error" ControlToValidate="txt_address1" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">Permanent Address:</label>
                                                            <textarea id="txt_address2" class="form-control" rows="2" placeholder="Enter Permanent Resident Address" runat="server"></textarea>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">Country:*</label>
                                                            <asp:DropDownList ID="drop_country" runat="server" Height="52px" class="form-control">
                                                                <asp:ListItem>Please select Country *</asp:ListItem>
                                                                <asp:ListItem>  AF:Afghanistan  </asp:ListItem>
                                                                <asp:ListItem>  AX:Åland Islands    </asp:ListItem>
                                                                <asp:ListItem>  AL:Albania  </asp:ListItem>
                                                                <asp:ListItem>  DZ:Algeria  </asp:ListItem>
                                                                <asp:ListItem>  AS:American Samoa   </asp:ListItem>
                                                                <asp:ListItem>  AD:Andorra  </asp:ListItem>
                                                                <asp:ListItem>  AO:Angola   </asp:ListItem>
                                                                <asp:ListItem>  AI:Anguilla </asp:ListItem>
                                                                <asp:ListItem>  AQ:Antarctica   </asp:ListItem>
                                                                <asp:ListItem>  AG:Antigua and Barbuda  </asp:ListItem>
                                                                <asp:ListItem>  AR:Argentina    </asp:ListItem>
                                                                <asp:ListItem>  AM:Armenia  </asp:ListItem>
                                                                <asp:ListItem>  AW:Aruba    </asp:ListItem>
                                                                <asp:ListItem>  AU:Australia    </asp:ListItem>
                                                                <asp:ListItem>  AT:Austria  </asp:ListItem>
                                                                <asp:ListItem>  AZ:Azerbaijan   </asp:ListItem>
                                                                <asp:ListItem>  BS:Bahamas  </asp:ListItem>
                                                                <asp:ListItem>  BH:Bahrain  </asp:ListItem>
                                                                <asp:ListItem>  BD:Bangladesh   </asp:ListItem>
                                                                <asp:ListItem>  BB:Barbados </asp:ListItem>
                                                                <asp:ListItem>  BY:Belarus  </asp:ListItem>
                                                                <asp:ListItem>  BE:Belgium  </asp:ListItem>
                                                                <asp:ListItem>  BZ:Belize   </asp:ListItem>
                                                                <asp:ListItem>  BJ:Benin    </asp:ListItem>
                                                                <asp:ListItem>  BM:Bermuda  </asp:ListItem>
                                                                <asp:ListItem>  BT:Bhutan   </asp:ListItem>
                                                                <asp:ListItem>  BO:Bolivia  </asp:ListItem>
                                                                <asp:ListItem>  BA:Bosnia and Herzegovina   </asp:ListItem>
                                                                <asp:ListItem>  BW:Botswana </asp:ListItem>
                                                                <asp:ListItem>  BV:Bouvet Island    </asp:ListItem>
                                                                <asp:ListItem>  BR:Brazil   </asp:ListItem>
                                                                <asp:ListItem>  IO:British Indian Ocean Territory   </asp:ListItem>
                                                                <asp:ListItem>  BN:Brunei Darussalam    </asp:ListItem>
                                                                <asp:ListItem>  BG:Bulgaria </asp:ListItem>
                                                                <asp:ListItem>  BF:Burkina Faso </asp:ListItem>
                                                                <asp:ListItem>  BI:Burundi  </asp:ListItem>
                                                                <asp:ListItem>  KH:Cambodia </asp:ListItem>
                                                                <asp:ListItem>  CM:Cameroon </asp:ListItem>
                                                                <asp:ListItem>  CA:Canada   </asp:ListItem>
                                                                <asp:ListItem>  CV:Cape Verde   </asp:ListItem>
                                                                <asp:ListItem>  KY:Cayman Islands   </asp:ListItem>
                                                                <asp:ListItem>  CF:Central African Republic </asp:ListItem>
                                                                <asp:ListItem>  TD:Chad </asp:ListItem>
                                                                <asp:ListItem>  CL:Chile    </asp:ListItem>
                                                                <asp:ListItem>  CN:China    </asp:ListItem>
                                                                <asp:ListItem>  CX:Christmas Island </asp:ListItem>
                                                                <asp:ListItem>  CC:Cocos (Keeling) Islands  </asp:ListItem>
                                                                <asp:ListItem>  CO:Colombia </asp:ListItem>
                                                                <asp:ListItem>  KM:Comoros  </asp:ListItem>
                                                                <asp:ListItem>  CG:Congo    </asp:ListItem>
                                                                <asp:ListItem>  CD:Congo, The Democratic Republic of The    </asp:ListItem>
                                                                <asp:ListItem>  CK:Cook Islands </asp:ListItem>
                                                                <asp:ListItem>  CR:Costa Rica   </asp:ListItem>
                                                                <asp:ListItem>  CI:Cote D'ivoire    </asp:ListItem>
                                                                <asp:ListItem>  HR:Croatia  </asp:ListItem>
                                                                <asp:ListItem>  CU:Cuba </asp:ListItem>
                                                                <asp:ListItem>  CY:Cyprus   </asp:ListItem>
                                                                <asp:ListItem>  CZ:Czech Republic   </asp:ListItem>
                                                                <asp:ListItem>  DK:Denmark  </asp:ListItem>
                                                                <asp:ListItem>  DJ:Djibouti </asp:ListItem>
                                                                <asp:ListItem>  DM:Dominica </asp:ListItem>
                                                                <asp:ListItem>  DO:Dominican Republic   </asp:ListItem>
                                                                <asp:ListItem>  EC:Ecuador  </asp:ListItem>
                                                                <asp:ListItem>  EG:Egypt    </asp:ListItem>
                                                                <asp:ListItem>  SV:El Salvador  </asp:ListItem>
                                                                <asp:ListItem>  GQ:Equatorial Guinea    </asp:ListItem>
                                                                <asp:ListItem>  ER:Eritrea  </asp:ListItem>
                                                                <asp:ListItem>  EE:Estonia  </asp:ListItem>
                                                                <asp:ListItem>  ET:Ethiopia </asp:ListItem>
                                                                <asp:ListItem>  FK:Falkland Islands (Malvinas)  </asp:ListItem>
                                                                <asp:ListItem>  FO:Faroe Islands    </asp:ListItem>
                                                                <asp:ListItem>  FJ:Fiji </asp:ListItem>
                                                                <asp:ListItem>  FI:Finland  </asp:ListItem>
                                                                <asp:ListItem>  FR:France   </asp:ListItem>
                                                                <asp:ListItem>  GF:French Guiana    </asp:ListItem>
                                                                <asp:ListItem>  PF:French Polynesia </asp:ListItem>
                                                                <asp:ListItem>  TF:French Southern Territories  </asp:ListItem>
                                                                <asp:ListItem>  GA:Gabon    </asp:ListItem>
                                                                <asp:ListItem>  GM:Gambia   </asp:ListItem>
                                                                <asp:ListItem>  GE:Georgia  </asp:ListItem>
                                                                <asp:ListItem>  DE:Germany  </asp:ListItem>
                                                                <asp:ListItem>  GH:Ghana    </asp:ListItem>
                                                                <asp:ListItem>  GI:Gibraltar    </asp:ListItem>
                                                                <asp:ListItem>  GR:Greece   </asp:ListItem>
                                                                <asp:ListItem>  GL:Greenland    </asp:ListItem>
                                                                <asp:ListItem>  GD:Grenada  </asp:ListItem>
                                                                <asp:ListItem>  GP:Guadeloupe   </asp:ListItem>
                                                                <asp:ListItem>  GU:Guam </asp:ListItem>
                                                                <asp:ListItem>  GT:Guatemala    </asp:ListItem>
                                                                <asp:ListItem>  GG:Guernsey </asp:ListItem>
                                                                <asp:ListItem>  GN:Guinea   </asp:ListItem>
                                                                <asp:ListItem>  GW:Guinea-bissau    </asp:ListItem>
                                                                <asp:ListItem>  GY:Guyana   </asp:ListItem>
                                                                <asp:ListItem>  HT:Haiti    </asp:ListItem>
                                                                <asp:ListItem>  HM:Heard Island and Mcdonald Islands    </asp:ListItem>
                                                                <asp:ListItem>  VA:Holy See (Vatican City State)    </asp:ListItem>
                                                                <asp:ListItem>  HN:Honduras </asp:ListItem>
                                                                <asp:ListItem>  HK:Hong Kong    </asp:ListItem>
                                                                <asp:ListItem>  HU:Hungary  </asp:ListItem>
                                                                <asp:ListItem>  IS:Iceland  </asp:ListItem>
                                                                <asp:ListItem>  IN:India    </asp:ListItem>
                                                                <asp:ListItem>  ID:Indonesia    </asp:ListItem>
                                                                <asp:ListItem>  IR:Iran, Islamic Republic of    </asp:ListItem>
                                                                <asp:ListItem>  IQ:Iraq </asp:ListItem>
                                                                <asp:ListItem>  IE:Ireland  </asp:ListItem>
                                                                <asp:ListItem>  IM:Isle of Man  </asp:ListItem>
                                                                <asp:ListItem>  IL:Israel   </asp:ListItem>
                                                                <asp:ListItem>  IT:Italy    </asp:ListItem>
                                                                <asp:ListItem>  JM:Jamaica  </asp:ListItem>
                                                                <asp:ListItem>  JP:Japan    </asp:ListItem>
                                                                <asp:ListItem>  JE:Jersey   </asp:ListItem>
                                                                <asp:ListItem>  JO:Jordan   </asp:ListItem>
                                                                <asp:ListItem>  KZ:Kazakhstan   </asp:ListItem>
                                                                <asp:ListItem>  KE:Kenya    </asp:ListItem>
                                                                <asp:ListItem>  KI:Kiribati </asp:ListItem>
                                                                <asp:ListItem>  KP:Korea, Democratic People's Republic of   </asp:ListItem>
                                                                <asp:ListItem>  KR:Korea, Republic of   </asp:ListItem>
                                                                <asp:ListItem>  KW:Kuwait   </asp:ListItem>
                                                                <asp:ListItem>  KG:Kyrgyzstan   </asp:ListItem>
                                                                <asp:ListItem>  LA:Lao People's Democratic Republic </asp:ListItem>
                                                                <asp:ListItem>  LV:Latvia   </asp:ListItem>
                                                                <asp:ListItem>  LB:Lebanon  </asp:ListItem>
                                                                <asp:ListItem>  LS:Lesotho  </asp:ListItem>
                                                                <asp:ListItem>  LR:Liberia  </asp:ListItem>
                                                                <asp:ListItem>  LY:Libyan Arab Jamahiriya   </asp:ListItem>
                                                                <asp:ListItem>  LI:Liechtenstein    </asp:ListItem>
                                                                <asp:ListItem>  LT:Lithuania    </asp:ListItem>
                                                                <asp:ListItem>  LU:Luxembourg   </asp:ListItem>
                                                                <asp:ListItem>  MO:Macao    </asp:ListItem>
                                                                <asp:ListItem>  MK:Macedonia The Former Yugoslav Republic of </asp:ListItem>
                                                                <asp:ListItem>  MG:Madagascar   </asp:ListItem>
                                                                <asp:ListItem>  MW:Malawi   </asp:ListItem>
                                                                <asp:ListItem>  MY:Malaysia </asp:ListItem>
                                                                <asp:ListItem>  MV:Maldives </asp:ListItem>
                                                                <asp:ListItem>  ML:Mali </asp:ListItem>
                                                                <asp:ListItem>  MT:Malta    </asp:ListItem>
                                                                <asp:ListItem>  MH:Marshall Islands </asp:ListItem>
                                                                <asp:ListItem>  MQ:Martinique   </asp:ListItem>
                                                                <asp:ListItem>  MR:Mauritania   </asp:ListItem>
                                                                <asp:ListItem>  MU:Mauritius    </asp:ListItem>
                                                                <asp:ListItem>  YT:Mayotte  </asp:ListItem>
                                                                <asp:ListItem>  MX:Mexico   </asp:ListItem>
                                                                <asp:ListItem>  FM:Micronesia, Federated States of  </asp:ListItem>
                                                                <asp:ListItem>  MD:Moldova, Republic of </asp:ListItem>
                                                                <asp:ListItem>  MC:Monaco   </asp:ListItem>
                                                                <asp:ListItem>  MN:Mongolia </asp:ListItem>
                                                                <asp:ListItem>  ME:Montenegro   </asp:ListItem>
                                                                <asp:ListItem>  MS:Montserrat   </asp:ListItem>
                                                                <asp:ListItem>  MA:Morocco  </asp:ListItem>
                                                                <asp:ListItem>  MZ:Mozambique   </asp:ListItem>
                                                                <asp:ListItem>  MM:Myanmar  </asp:ListItem>
                                                                <asp:ListItem>  NA:Namibia  </asp:ListItem>
                                                                <asp:ListItem>  NR:Nauru    </asp:ListItem>
                                                                <asp:ListItem>  NP:Nepal    </asp:ListItem>
                                                                <asp:ListItem>  NL:Netherlands  </asp:ListItem>
                                                                <asp:ListItem>  AN:Netherlands Antilles </asp:ListItem>
                                                                <asp:ListItem>  NC:New Caledonia    </asp:ListItem>
                                                                <asp:ListItem>  NZ:New Zealand  </asp:ListItem>
                                                                <asp:ListItem>  NI:Nicaragua    </asp:ListItem>
                                                                <asp:ListItem>  NE:Niger    </asp:ListItem>
                                                                <asp:ListItem>  NG:Nigeria  </asp:ListItem>
                                                                <asp:ListItem>  NU:Niue </asp:ListItem>
                                                                <asp:ListItem>  NF:Norfolk Island   </asp:ListItem>
                                                                <asp:ListItem>  MP:Northern Mariana Islands </asp:ListItem>
                                                                <asp:ListItem>  NO:Norway   </asp:ListItem>
                                                                <asp:ListItem>  OM:Oman </asp:ListItem>
                                                                <asp:ListItem>  PK:Pakistan </asp:ListItem>
                                                                <asp:ListItem>  PW:Palau    </asp:ListItem>
                                                                <asp:ListItem>  PS:Palestinian Territory, Occupied  </asp:ListItem>
                                                                <asp:ListItem>  PA:Panama   </asp:ListItem>
                                                                <asp:ListItem>  PG:Papua New Guinea </asp:ListItem>
                                                                <asp:ListItem>  PY:Paraguay </asp:ListItem>
                                                                <asp:ListItem>  PE:Peru </asp:ListItem>
                                                                <asp:ListItem>  PH:Philippines  </asp:ListItem>
                                                                <asp:ListItem>  PN:Pitcairn </asp:ListItem>
                                                                <asp:ListItem>  PL:Poland   </asp:ListItem>
                                                                <asp:ListItem>  PT:Portugal </asp:ListItem>
                                                                <asp:ListItem>  PR:Puerto Rico  </asp:ListItem>
                                                                <asp:ListItem>  QA:Qatar    </asp:ListItem>
                                                                <asp:ListItem>  RE:Reunion  </asp:ListItem>
                                                                <asp:ListItem>  RO:Romania  </asp:ListItem>
                                                                <asp:ListItem>  RU:Russian Federation   </asp:ListItem>
                                                                <asp:ListItem>  RW:Rwanda   </asp:ListItem>
                                                                <asp:ListItem>  SH:Saint Helena </asp:ListItem>
                                                                <asp:ListItem>  KN:Saint Kitts and Nevis    </asp:ListItem>
                                                                <asp:ListItem>  LC:Saint Lucia  </asp:ListItem>
                                                                <asp:ListItem>  PM:Saint Pierre and Miquelon    </asp:ListItem>
                                                                <asp:ListItem>  VC:Saint Vincent and The Grenadines </asp:ListItem>
                                                                <asp:ListItem>  WS:Samoa    </asp:ListItem>
                                                                <asp:ListItem>  SM:San Marino   </asp:ListItem>
                                                                <asp:ListItem>  ST:Sao Tome and Principe    </asp:ListItem>
                                                                <asp:ListItem>  SA:Saudi Arabia </asp:ListItem>
                                                                <asp:ListItem>  SN:Senegal  </asp:ListItem>
                                                                <asp:ListItem>  RS:Serbia   </asp:ListItem>
                                                                <asp:ListItem>  SC:Seychelles   </asp:ListItem>
                                                                <asp:ListItem>  SL:Sierra Leone </asp:ListItem>
                                                                <asp:ListItem>  SG:Singapore    </asp:ListItem>
                                                                <asp:ListItem>  SK:Slovakia </asp:ListItem>
                                                                <asp:ListItem>  SI:Slovenia </asp:ListItem>
                                                                <asp:ListItem>  SB:Solomon Islands  </asp:ListItem>
                                                                <asp:ListItem>  SO:Somalia  </asp:ListItem>
                                                                <asp:ListItem>  ZA:South Africa </asp:ListItem>
                                                                <asp:ListItem>  GS:South Georgia and The South Sandwich Islands </asp:ListItem>
                                                                <asp:ListItem>  ES:Spain    </asp:ListItem>
                                                                <asp:ListItem>  LK:Sri Lanka    </asp:ListItem>
                                                                <asp:ListItem>  SD:Sudan    </asp:ListItem>
                                                                <asp:ListItem>  SR:Suriname </asp:ListItem>
                                                                <asp:ListItem>  SJ:Svalbard and Jan Mayen   </asp:ListItem>
                                                                <asp:ListItem>  SZ:Swaziland    </asp:ListItem>
                                                                <asp:ListItem>  SE:Sweden   </asp:ListItem>
                                                                <asp:ListItem>  CH:Switzerland  </asp:ListItem>
                                                                <asp:ListItem>  SY:Syrian Arab Republic </asp:ListItem>
                                                                <asp:ListItem>  TW:Taiwan, Province of China    </asp:ListItem>
                                                                <asp:ListItem>  TJ:Tajikistan   </asp:ListItem>
                                                                <asp:ListItem>  TZ:Tanzania, United Republic of </asp:ListItem>
                                                                <asp:ListItem>  TH:Thailand </asp:ListItem>
                                                                <asp:ListItem>  TL:Timor-leste  </asp:ListItem>
                                                                <asp:ListItem>  TG:Togo </asp:ListItem>
                                                                <asp:ListItem>  TK:Tokelau  </asp:ListItem>
                                                                <asp:ListItem>  TO:Tonga    </asp:ListItem>
                                                                <asp:ListItem>  TT:Trinidad and Tobago  </asp:ListItem>
                                                                <asp:ListItem>  TN:Tunisia  </asp:ListItem>
                                                                <asp:ListItem>  TR:Turkey   </asp:ListItem>
                                                                <asp:ListItem>  TM:Turkmenistan </asp:ListItem>
                                                                <asp:ListItem>  TC:Turks and Caicos Islands </asp:ListItem>
                                                                <asp:ListItem>  TV:Tuvalu   </asp:ListItem>
                                                                <asp:ListItem>  UG:Uganda   </asp:ListItem>
                                                                <asp:ListItem>  UA:Ukraine  </asp:ListItem>
                                                                <asp:ListItem>  AE:United Arab Emirates </asp:ListItem>
                                                                <asp:ListItem>  GB:United Kingdom   </asp:ListItem>
                                                                <asp:ListItem>  US:United States    </asp:ListItem>
                                                                <asp:ListItem>  UM:United States Minor Outlying Islands </asp:ListItem>
                                                                <asp:ListItem>  UY:Uruguay  </asp:ListItem>
                                                                <asp:ListItem>  UZ:Uzbekistan   </asp:ListItem>
                                                                <asp:ListItem>  VU:Vanuatu  </asp:ListItem>
                                                                <asp:ListItem>  VE:Venezuela    </asp:ListItem>
                                                                <asp:ListItem>  VN:Viet Nam </asp:ListItem>
                                                                <asp:ListItem>  VG:Virgin Islands, British  </asp:ListItem>
                                                                <asp:ListItem>  VI:Virgin Islands, U.S. </asp:ListItem>
                                                                <asp:ListItem>  WF:Wallis and Futuna    </asp:ListItem>
                                                                <asp:ListItem>  EH:Western Sahara   </asp:ListItem>
                                                                <asp:ListItem>  YE:Yemen    </asp:ListItem>
                                                                <asp:ListItem>  ZM:Zambia   </asp:ListItem>
                                                                <asp:ListItem>  ZW:Zimbabwe </asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvType" runat="server" CssClass="error" ControlToValidate="drop_country" Display="Dynamic" InitialValue="Please select Country *" ErrorMessage="Required" ValidationGroup="aac"></asp:RequiredFieldValidator>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">State: *</label>
                                                            <input type="text" id="txt_state" class="form-control" placeholder=" Enter State *" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" CssClass="error" ControlToValidate="txt_state" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">City: *</label>
                                                            <input type="text" id="txt_city" class="form-control" placeholder=" Enter City *" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" CssClass="error" ControlToValidate="txt_city" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">Pincode: *</label>
                                                            <input type="text" id="txt_pincode" class="form-control" placeholder=" Enter Pincode*" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" CssClass="error" ControlToValidate="txt_pincode" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label class="fieldlabels">Candidate ID</label>
                                                            <input type="text" id="txt_CandidateId" class="form-control" disabled runat="server" />
                                                        </div>

                                                    </div>
                                                </div>
                                                <%-- <input type="button" name="next" class="next action-button" value="Next" />--%>
                                                <asp:LinkButton ID="next1" type="button" runat="server" class="next action-button" ValidationGroup="aac" OnClick="LBtn_next1" Style="padding: 14px 14px;">Next <i class="fa fa-chevron-right" ></i></asp:LinkButton>
                                            </fieldset>
                                            <fieldset id="dvExamDetail" runat="server" clientidmode="Static">
                                                <div class="form-card">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <h2 class="fs-title">Fill Exams Details (*) fields are required </h2>
                                                        </div>
                                                        <div class="col-5">
                                                            <h2 class="steps">Step 2 - 4</h2>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-bottom: 3rem;">
                                                        <div class="col-lg-4 col-md-4 col-sm-4">

                                                            <label class="fieldlabels">Country:</label>
                                                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="next2" CssClass="error" ControlToValidate="ddlCountry" InitialValue="-1" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>


                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">

                                                            <label class="fieldlabels">State/Provinces:</label>
                                                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4" id="dvCity" runat="server">
                                                            <label class="fieldlabels">City:</label>
                                                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"></asp:DropDownList>
                                                        </div>
                                                        <div id="div1" runat="server" class="col-lg-8 col-md-8 col-sm-8 ">
                                                            <label class="fieldlabels" for="">Select Exam:*</label>
                                                            <asp:DropDownList ID="ddlExam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlExam_SelectedIndexChanged"></asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" SetFocusOnError="true" ValidationGroup="next2" CssClass="error" ControlToValidate="ddlExam" InitialValue="-1"
                                                                runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4" id="div3" runat="server" visible="false">
                                                            <label class="fieldlabels">Fees</label>
                                                            <input type="text" id="Txt_examfees" class="form-control" runat="server" disabled />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4" id="div2" runat="server" visible="false">
                                                            <label class="fieldlabels">Selected Exam : <span style="font-size: 18px; color: red;">*</span></label>
                                                            <asp:Label ID="Lbl_exam" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 mr-5" id="candidate-test-center" style="/*display: none; */padding: 30px 30px 14px 30px; border: 1px solid #ddd; box-shadow: 5px 5px 2px 2px grey;">
                                                            <div class="" id="div11" runat="server">
                                                                <h4 class="text-center pb-3">Test Center Near By You (<asp:Label ID="Lbl_centercount" runat="server" Text="0"></asp:Label>)</h4>
                                                            </div>
                                                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                                                <div class="carousel-inner">
                                                                    <div class="carousel-item active">
                                                                        <div class="row">
                                                                            <asp:Repeater ID="Rpt_Center" runat="server" ClientIDMode="Static">
                                                                                <ItemTemplate>
                                                                                    <div class="col-md-6">
                                                                                        <div class="card" style="border-top: 3px solid #007388;">
                                                                                            <p class="card-body">
                                                                                                <asp:Label ID="lbl_centerid" runat="server" Text='<%# Eval("center_id") %>' Visible="false" />
                                                                                                <h5 class="card-title">
                                                                                                    <asp:Label ID="lbl_centername" runat="server" Text='<%#Eval("center_name")%>' /></h5>
                                                                                                <p class="card-text">
                                                                                                    <asp:Label ID="lbl_OwnerAddress" runat="server" Text='<%#Eval("Owner_Address")%>' />
                                                                                                </p>
                                                                                            <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal"  data-bs-backdrop="false">
                                                                                        Read more
                                                                                    </button> -->

                                                                                            <span style="display: flex; justify-content: space-between;">
                                                                                                <div id="Div8" runat="server" style="font-size: 18px; color: red; display: none;" visible='<%#string.IsNullOrEmpty(Eval("ManageHoursId").ToString())%>'>
                                                                                                    <span>This test center is closed.</span>
                                                                                                </div>

                                                                                                <div id="div_hide" runat="server" visible="false">
                                                                                                    <div class="col-xs-12 col-md-12 col-lg-12 mb-5 p-t-5">
                                                                                                        <h6 style="color: #0e0e0e;">
                                                                                                            <asp:Label ID="Lbl_date" runat="server" Display="Dynamic" />
                                                                                                        </h6>
                                                                                                    </div>
                                                                                                    <div class="col-xs-12 col-md-12 col-lg-12 p-t-5 mb-10" style="">
                                                                                                        <h6 style="color: #0e0e0e;">
                                                                                                            <asp:Label ID="Lbl_Time" runat="server" Display="Dynamic" /></h6>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </span>
                                                                                            <span style="display: flex; justify-content: space-between;" id="Div5" runat="server" visible='<%#!string.IsNullOrEmpty(Eval("ManageHoursId").ToString())%>'>
                                                                                                <p type="button" data-bs-toggle="modal" data-bs-target="#myModal" data-bs-backdrop="false" onclick="FillCenterData('<%#Eval("centerid") %>')">View Detail</p>
                                                                                                <p type="button" data-bs-toggle="modal" data-bs-target="#myModal12" data-bs-backdrop="false" onclick="SetDateTimePicker('<%# Eval("center_id") %>','<%#Eval("center_name")%>');">Select Center</p>
                                                                                            </span>
                                                                                            <span id="Div4" runat="server" visible='<%#string.IsNullOrEmpty(Eval("ManageHoursId").ToString())%>'>
                                                                                                <p class="detail_tag_red" style="cursor: not-allowed;" disabled>Center Closed</p>
                                                                                            </span>
                                                                                            <!-- <p type="button" data-bs-toggle="modal" data-bs-target="#myModal">Read more</p> -->
                                                                                        </div>
                                                                                    </div>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="alert alert-warning alert-dismissible" role="alert" runat="server" id="error_msg1" clientidmode="Static" visible="false">
                                                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                                                    <strong style="color: red;">Please choose a center. </strong>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                    <asp:LinkButton ID="next2" type="button" runat="server" CssClass="next action-button" ValidationGroup="next2" OnClick="LBtn_next2" Style="padding: 14px 14px;">Next <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="back2" type="button" runat="server" CssClass="next action-button" ValidationGroup="back2" OnClick="LBtn_back2" Style="padding: 14px 14px;"><i class="fa fa-chevron-left"> Previous</i></asp:LinkButton>
                                                </div>
                                            </fieldset>
                                            <fieldset id="dvReviewDetail" runat="server" clientidmode="Static">
                                                <div class="form-card">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <h2 class="fs-title">Review Your Personal Details:</h2>
                                                            <!-- <p><span style="font-weight: bold;">Note*:</span> Must be authorized to sign agreements on behalf of your company</p> -->
                                                        </div>
                                                        <div class="col-5">
                                                            <h2 class="steps">Step 3 - 4</h2>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <p class="fs-title">
                                                                Candidate Id:
                                                                <asp:Label ID="lblReviewCandidateId" runat="server"></asp:Label>
                                                            </p>
                                                            <!-- <p><span style="font-weight: bold;">Note*:</span> Must be authorized to sign agreements on behalf of your company</p> -->
                                                        </div>
                                                        <div class="col-5">
                                                            <asp:LinkButton ID="LB_edit1" CssClass="action-button" type="button" runat="server" OnClick="LBtn_edit1">Edit</asp:LinkButton>
                                                            <asp:LinkButton ID="LB_update1" type="button" runat="server" OnClick="LBtn_update1" ValidationGroup="review" Visible="false">Update</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-bottom: 1rem;">
                                                        <div class="col-md-2 col-sm-6 col-xs-6 col-lg-2">
                                                            <!-- <label class="fieldlabels" >Name</label> -->
                                                            <p>Candidate Name</p>

                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6 col-lg-3">
                                                            <input type="text" id="Review_Firstname" runat="server" class="form-control" readonly="readonly" />
                                                            <asp:RequiredFieldValidator CssClass="error" ValidationGroup="review" ControlToValidate="Review_Firstname" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="text" id="Review_Middlename" runat="server" class="form-control" readonly="readonly" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" id="Review_Lastname" runat="server" class="form-control" readonly="readonly" />
                                                            <asp:RequiredFieldValidator CssClass="error" ValidationGroup="review" ControlToValidate="Review_Lastname" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 1rem;">
                                                        <div class="col-md-2 col-sm-6 col-xs-6 col-lg-2">
                                                            <p>DOB</p>
                                                        </div>
                                                        <div class="col-md-4 col-sm-6 col-xs-6 col-lg-4">
                                                            <input id="Review_DOB" runat="server" class="form-control" disabled />
                                                            <asp:RequiredFieldValidator CssClass="error" ValidationGroup="review" ControlToValidate="Review_DOB" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-md-2 col-sm-6 col-lg-2">
                                                            <p>Gender</p>
                                                        </div>
                                                        <div class="col-md-4 col-sm-6 col-xs-6 col-lg-4">
                                                            <asp:DropDownList ID="ddl_ReviewGender" runat="server" Enabled="false" CssClass="form-control">
                                                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                                <asp:ListItem Value="M">Male</asp:ListItem>
                                                                <asp:ListItem Value="F">Female</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator CssClass="error" ControlToValidate="ddl_ReviewGender" InitialValue="0" runat="server" ErrorMessage="Required" Display="Dynamic" ValidationGroup="review"></asp:RequiredFieldValidator>

                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Company Name</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-6">
                                                            <input type="text" id="Review_CompanyName" class="form-control" runat="server" readonly="readonly" />
                                                            <asp:RequiredFieldValidator CssClass="error" ID="rfvReviewCompanyName" ValidationGroup="review" ControlToValidate="Review_CompanyName" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Designation</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-6">
                                                            <input type="text" id="Review_Designation" runat="server" class="form-control" readonly="readonly" />
                                                            <asp:RequiredFieldValidator CssClass="error" ID="rfvReviewDesignation" ValidationGroup="review" ControlToValidate="Review_Designation" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-6 col-sm-6"></div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Email ID</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="email" id="Review_email" runat="server" class="form-control" readonly="readonly" />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Mobile Number</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_mobilenumber" runat="server" class="form-control" readonly="readonly" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="15" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" CssClass="error" ValidationGroup="review" ControlToValidate="Review_mobilenumber" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Phone Number</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_phonenumber" runat="server" class="form-control" readonly="readonly" />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Address</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_address" runat="server" class="form-control" readonly="readonly" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" CssClass="error" ValidationGroup="review" ControlToValidate="Review_address" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Country</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <asp:DropDownList ID="Review_country" runat="server" Enabled="false" CssClass="form-control">
                                                                <asp:ListItem>Please select Country *</asp:ListItem>
                                                                <asp:ListItem>  AF:Afghanistan  </asp:ListItem>
                                                                <asp:ListItem>  AX:Åland Islands    </asp:ListItem>
                                                                <asp:ListItem>  AL:Albania  </asp:ListItem>
                                                                <asp:ListItem>  DZ:Algeria  </asp:ListItem>
                                                                <asp:ListItem>  AS:American Samoa   </asp:ListItem>
                                                                <asp:ListItem>  AD:Andorra  </asp:ListItem>
                                                                <asp:ListItem>  AO:Angola   </asp:ListItem>
                                                                <asp:ListItem>  AI:Anguilla </asp:ListItem>
                                                                <asp:ListItem>  AQ:Antarctica   </asp:ListItem>
                                                                <asp:ListItem>  AG:Antigua and Barbuda  </asp:ListItem>
                                                                <asp:ListItem>  AR:Argentina    </asp:ListItem>
                                                                <asp:ListItem>  AM:Armenia  </asp:ListItem>
                                                                <asp:ListItem>  AW:Aruba    </asp:ListItem>
                                                                <asp:ListItem>  AU:Australia    </asp:ListItem>
                                                                <asp:ListItem>  AT:Austria  </asp:ListItem>
                                                                <asp:ListItem>  AZ:Azerbaijan   </asp:ListItem>
                                                                <asp:ListItem>  BS:Bahamas  </asp:ListItem>
                                                                <asp:ListItem>  BH:Bahrain  </asp:ListItem>
                                                                <asp:ListItem>  BD:Bangladesh   </asp:ListItem>
                                                                <asp:ListItem>  BB:Barbados </asp:ListItem>
                                                                <asp:ListItem>  BY:Belarus  </asp:ListItem>
                                                                <asp:ListItem>  BE:Belgium  </asp:ListItem>
                                                                <asp:ListItem>  BZ:Belize   </asp:ListItem>
                                                                <asp:ListItem>  BJ:Benin    </asp:ListItem>
                                                                <asp:ListItem>  BM:Bermuda  </asp:ListItem>
                                                                <asp:ListItem>  BT:Bhutan   </asp:ListItem>
                                                                <asp:ListItem>  BO:Bolivia  </asp:ListItem>
                                                                <asp:ListItem>  BA:Bosnia and Herzegovina   </asp:ListItem>
                                                                <asp:ListItem>  BW:Botswana </asp:ListItem>
                                                                <asp:ListItem>  BV:Bouvet Island    </asp:ListItem>
                                                                <asp:ListItem>  BR:Brazil   </asp:ListItem>
                                                                <asp:ListItem>  IO:British Indian Ocean Territory   </asp:ListItem>
                                                                <asp:ListItem>  BN:Brunei Darussalam    </asp:ListItem>
                                                                <asp:ListItem>  BG:Bulgaria </asp:ListItem>
                                                                <asp:ListItem>  BF:Burkina Faso </asp:ListItem>
                                                                <asp:ListItem>  BI:Burundi  </asp:ListItem>
                                                                <asp:ListItem>  KH:Cambodia </asp:ListItem>
                                                                <asp:ListItem>  CM:Cameroon </asp:ListItem>
                                                                <asp:ListItem>  CA:Canada   </asp:ListItem>
                                                                <asp:ListItem>  CV:Cape Verde   </asp:ListItem>
                                                                <asp:ListItem>  KY:Cayman Islands   </asp:ListItem>
                                                                <asp:ListItem>  CF:Central African Republic </asp:ListItem>
                                                                <asp:ListItem>  TD:Chad </asp:ListItem>
                                                                <asp:ListItem>  CL:Chile    </asp:ListItem>
                                                                <asp:ListItem>  CN:China    </asp:ListItem>
                                                                <asp:ListItem>  CX:Christmas Island </asp:ListItem>
                                                                <asp:ListItem>  CC:Cocos (Keeling) Islands  </asp:ListItem>
                                                                <asp:ListItem>  CO:Colombia </asp:ListItem>
                                                                <asp:ListItem>  KM:Comoros  </asp:ListItem>
                                                                <asp:ListItem>  CG:Congo    </asp:ListItem>
                                                                <asp:ListItem>  CD:Congo, The Democratic Republic of The    </asp:ListItem>
                                                                <asp:ListItem>  CK:Cook Islands </asp:ListItem>
                                                                <asp:ListItem>  CR:Costa Rica   </asp:ListItem>
                                                                <asp:ListItem>  CI:Cote D'ivoire    </asp:ListItem>
                                                                <asp:ListItem>  HR:Croatia  </asp:ListItem>
                                                                <asp:ListItem>  CU:Cuba </asp:ListItem>
                                                                <asp:ListItem>  CY:Cyprus   </asp:ListItem>
                                                                <asp:ListItem>  CZ:Czech Republic   </asp:ListItem>
                                                                <asp:ListItem>  DK:Denmark  </asp:ListItem>
                                                                <asp:ListItem>  DJ:Djibouti </asp:ListItem>
                                                                <asp:ListItem>  DM:Dominica </asp:ListItem>
                                                                <asp:ListItem>  DO:Dominican Republic   </asp:ListItem>
                                                                <asp:ListItem>  EC:Ecuador  </asp:ListItem>
                                                                <asp:ListItem>  EG:Egypt    </asp:ListItem>
                                                                <asp:ListItem>  SV:El Salvador  </asp:ListItem>
                                                                <asp:ListItem>  GQ:Equatorial Guinea    </asp:ListItem>
                                                                <asp:ListItem>  ER:Eritrea  </asp:ListItem>
                                                                <asp:ListItem>  EE:Estonia  </asp:ListItem>
                                                                <asp:ListItem>  ET:Ethiopia </asp:ListItem>
                                                                <asp:ListItem>  FK:Falkland Islands (Malvinas)  </asp:ListItem>
                                                                <asp:ListItem>  FO:Faroe Islands    </asp:ListItem>
                                                                <asp:ListItem>  FJ:Fiji </asp:ListItem>
                                                                <asp:ListItem>  FI:Finland  </asp:ListItem>
                                                                <asp:ListItem>  FR:France   </asp:ListItem>
                                                                <asp:ListItem>  GF:French Guiana    </asp:ListItem>
                                                                <asp:ListItem>  PF:French Polynesia </asp:ListItem>
                                                                <asp:ListItem>  TF:French Southern Territories  </asp:ListItem>
                                                                <asp:ListItem>  GA:Gabon    </asp:ListItem>
                                                                <asp:ListItem>  GM:Gambia   </asp:ListItem>
                                                                <asp:ListItem>  GE:Georgia  </asp:ListItem>
                                                                <asp:ListItem>  DE:Germany  </asp:ListItem>
                                                                <asp:ListItem>  GH:Ghana    </asp:ListItem>
                                                                <asp:ListItem>  GI:Gibraltar    </asp:ListItem>
                                                                <asp:ListItem>  GR:Greece   </asp:ListItem>
                                                                <asp:ListItem>  GL:Greenland    </asp:ListItem>
                                                                <asp:ListItem>  GD:Grenada  </asp:ListItem>
                                                                <asp:ListItem>  GP:Guadeloupe   </asp:ListItem>
                                                                <asp:ListItem>  GU:Guam </asp:ListItem>
                                                                <asp:ListItem>  GT:Guatemala    </asp:ListItem>
                                                                <asp:ListItem>  GG:Guernsey </asp:ListItem>
                                                                <asp:ListItem>  GN:Guinea   </asp:ListItem>
                                                                <asp:ListItem>  GW:Guinea-bissau    </asp:ListItem>
                                                                <asp:ListItem>  GY:Guyana   </asp:ListItem>
                                                                <asp:ListItem>  HT:Haiti    </asp:ListItem>
                                                                <asp:ListItem>  HM:Heard Island and Mcdonald Islands    </asp:ListItem>
                                                                <asp:ListItem>  VA:Holy See (Vatican City State)    </asp:ListItem>
                                                                <asp:ListItem>  HN:Honduras </asp:ListItem>
                                                                <asp:ListItem>  HK:Hong Kong    </asp:ListItem>
                                                                <asp:ListItem>  HU:Hungary  </asp:ListItem>
                                                                <asp:ListItem>  IS:Iceland  </asp:ListItem>
                                                                <asp:ListItem>  IN:India    </asp:ListItem>
                                                                <asp:ListItem>  ID:Indonesia    </asp:ListItem>
                                                                <asp:ListItem>  IR:Iran, Islamic Republic of    </asp:ListItem>
                                                                <asp:ListItem>  IQ:Iraq </asp:ListItem>
                                                                <asp:ListItem>  IE:Ireland  </asp:ListItem>
                                                                <asp:ListItem>  IM:Isle of Man  </asp:ListItem>
                                                                <asp:ListItem>  IL:Israel   </asp:ListItem>
                                                                <asp:ListItem>  IT:Italy    </asp:ListItem>
                                                                <asp:ListItem>  JM:Jamaica  </asp:ListItem>
                                                                <asp:ListItem>  JP:Japan    </asp:ListItem>
                                                                <asp:ListItem>  JE:Jersey   </asp:ListItem>
                                                                <asp:ListItem>  JO:Jordan   </asp:ListItem>
                                                                <asp:ListItem>  KZ:Kazakhstan   </asp:ListItem>
                                                                <asp:ListItem>  KE:Kenya    </asp:ListItem>
                                                                <asp:ListItem>  KI:Kiribati </asp:ListItem>
                                                                <asp:ListItem>  KP:Korea, Democratic People's Republic of   </asp:ListItem>
                                                                <asp:ListItem>  KR:Korea, Republic of   </asp:ListItem>
                                                                <asp:ListItem>  KW:Kuwait   </asp:ListItem>
                                                                <asp:ListItem>  KG:Kyrgyzstan   </asp:ListItem>
                                                                <asp:ListItem>  LA:Lao People's Democratic Republic </asp:ListItem>
                                                                <asp:ListItem>  LV:Latvia   </asp:ListItem>
                                                                <asp:ListItem>  LB:Lebanon  </asp:ListItem>
                                                                <asp:ListItem>  LS:Lesotho  </asp:ListItem>
                                                                <asp:ListItem>  LR:Liberia  </asp:ListItem>
                                                                <asp:ListItem>  LY:Libyan Arab Jamahiriya   </asp:ListItem>
                                                                <asp:ListItem>  LI:Liechtenstein    </asp:ListItem>
                                                                <asp:ListItem>  LT:Lithuania    </asp:ListItem>
                                                                <asp:ListItem>  LU:Luxembourg   </asp:ListItem>
                                                                <asp:ListItem>  MO:Macao    </asp:ListItem>
                                                                <asp:ListItem>  MK:Macedonia The Former Yugoslav Republic of </asp:ListItem>
                                                                <asp:ListItem>  MG:Madagascar   </asp:ListItem>
                                                                <asp:ListItem>  MW:Malawi   </asp:ListItem>
                                                                <asp:ListItem>  MY:Malaysia </asp:ListItem>
                                                                <asp:ListItem>  MV:Maldives </asp:ListItem>
                                                                <asp:ListItem>  ML:Mali </asp:ListItem>
                                                                <asp:ListItem>  MT:Malta    </asp:ListItem>
                                                                <asp:ListItem>  MH:Marshall Islands </asp:ListItem>
                                                                <asp:ListItem>  MQ:Martinique   </asp:ListItem>
                                                                <asp:ListItem>  MR:Mauritania   </asp:ListItem>
                                                                <asp:ListItem>  MU:Mauritius    </asp:ListItem>
                                                                <asp:ListItem>  YT:Mayotte  </asp:ListItem>
                                                                <asp:ListItem>  MX:Mexico   </asp:ListItem>
                                                                <asp:ListItem>  FM:Micronesia, Federated States of  </asp:ListItem>
                                                                <asp:ListItem>  MD:Moldova, Republic of </asp:ListItem>
                                                                <asp:ListItem>  MC:Monaco   </asp:ListItem>
                                                                <asp:ListItem>  MN:Mongolia </asp:ListItem>
                                                                <asp:ListItem>  ME:Montenegro   </asp:ListItem>
                                                                <asp:ListItem>  MS:Montserrat   </asp:ListItem>
                                                                <asp:ListItem>  MA:Morocco  </asp:ListItem>
                                                                <asp:ListItem>  MZ:Mozambique   </asp:ListItem>
                                                                <asp:ListItem>  MM:Myanmar  </asp:ListItem>
                                                                <asp:ListItem>  NA:Namibia  </asp:ListItem>
                                                                <asp:ListItem>  NR:Nauru    </asp:ListItem>
                                                                <asp:ListItem>  NP:Nepal    </asp:ListItem>
                                                                <asp:ListItem>  NL:Netherlands  </asp:ListItem>
                                                                <asp:ListItem>  AN:Netherlands Antilles </asp:ListItem>
                                                                <asp:ListItem>  NC:New Caledonia    </asp:ListItem>
                                                                <asp:ListItem>  NZ:New Zealand  </asp:ListItem>
                                                                <asp:ListItem>  NI:Nicaragua    </asp:ListItem>
                                                                <asp:ListItem>  NE:Niger    </asp:ListItem>
                                                                <asp:ListItem>  NG:Nigeria  </asp:ListItem>
                                                                <asp:ListItem>  NU:Niue </asp:ListItem>
                                                                <asp:ListItem>  NF:Norfolk Island   </asp:ListItem>
                                                                <asp:ListItem>  MP:Northern Mariana Islands </asp:ListItem>
                                                                <asp:ListItem>  NO:Norway   </asp:ListItem>
                                                                <asp:ListItem>  OM:Oman </asp:ListItem>
                                                                <asp:ListItem>  PK:Pakistan </asp:ListItem>
                                                                <asp:ListItem>  PW:Palau    </asp:ListItem>
                                                                <asp:ListItem>  PS:Palestinian Territory, Occupied  </asp:ListItem>
                                                                <asp:ListItem>  PA:Panama   </asp:ListItem>
                                                                <asp:ListItem>  PG:Papua New Guinea </asp:ListItem>
                                                                <asp:ListItem>  PY:Paraguay </asp:ListItem>
                                                                <asp:ListItem>  PE:Peru </asp:ListItem>
                                                                <asp:ListItem>  PH:Philippines  </asp:ListItem>
                                                                <asp:ListItem>  PN:Pitcairn </asp:ListItem>
                                                                <asp:ListItem>  PL:Poland   </asp:ListItem>
                                                                <asp:ListItem>  PT:Portugal </asp:ListItem>
                                                                <asp:ListItem>  PR:Puerto Rico  </asp:ListItem>
                                                                <asp:ListItem>  QA:Qatar    </asp:ListItem>
                                                                <asp:ListItem>  RE:Reunion  </asp:ListItem>
                                                                <asp:ListItem>  RO:Romania  </asp:ListItem>
                                                                <asp:ListItem>  RU:Russian Federation   </asp:ListItem>
                                                                <asp:ListItem>  RW:Rwanda   </asp:ListItem>
                                                                <asp:ListItem>  SH:Saint Helena </asp:ListItem>
                                                                <asp:ListItem>  KN:Saint Kitts and Nevis    </asp:ListItem>
                                                                <asp:ListItem>  LC:Saint Lucia  </asp:ListItem>
                                                                <asp:ListItem>  PM:Saint Pierre and Miquelon    </asp:ListItem>
                                                                <asp:ListItem>  VC:Saint Vincent and The Grenadines </asp:ListItem>
                                                                <asp:ListItem>  WS:Samoa    </asp:ListItem>
                                                                <asp:ListItem>  SM:San Marino   </asp:ListItem>
                                                                <asp:ListItem>  ST:Sao Tome and Principe    </asp:ListItem>
                                                                <asp:ListItem>  SA:Saudi Arabia </asp:ListItem>
                                                                <asp:ListItem>  SN:Senegal  </asp:ListItem>
                                                                <asp:ListItem>  RS:Serbia   </asp:ListItem>
                                                                <asp:ListItem>  SC:Seychelles   </asp:ListItem>
                                                                <asp:ListItem>  SL:Sierra Leone </asp:ListItem>
                                                                <asp:ListItem>  SG:Singapore    </asp:ListItem>
                                                                <asp:ListItem>  SK:Slovakia </asp:ListItem>
                                                                <asp:ListItem>  SI:Slovenia </asp:ListItem>
                                                                <asp:ListItem>  SB:Solomon Islands  </asp:ListItem>
                                                                <asp:ListItem>  SO:Somalia  </asp:ListItem>
                                                                <asp:ListItem>  ZA:South Africa </asp:ListItem>
                                                                <asp:ListItem>  GS:South Georgia and The South Sandwich Islands </asp:ListItem>
                                                                <asp:ListItem>  ES:Spain    </asp:ListItem>
                                                                <asp:ListItem>  LK:Sri Lanka    </asp:ListItem>
                                                                <asp:ListItem>  SD:Sudan    </asp:ListItem>
                                                                <asp:ListItem>  SR:Suriname </asp:ListItem>
                                                                <asp:ListItem>  SJ:Svalbard and Jan Mayen   </asp:ListItem>
                                                                <asp:ListItem>  SZ:Swaziland    </asp:ListItem>
                                                                <asp:ListItem>  SE:Sweden   </asp:ListItem>
                                                                <asp:ListItem>  CH:Switzerland  </asp:ListItem>
                                                                <asp:ListItem>  SY:Syrian Arab Republic </asp:ListItem>
                                                                <asp:ListItem>  TW:Taiwan, Province of China    </asp:ListItem>
                                                                <asp:ListItem>  TJ:Tajikistan   </asp:ListItem>
                                                                <asp:ListItem>  TZ:Tanzania, United Republic of </asp:ListItem>
                                                                <asp:ListItem>  TH:Thailand </asp:ListItem>
                                                                <asp:ListItem>  TL:Timor-leste  </asp:ListItem>
                                                                <asp:ListItem>  TG:Togo </asp:ListItem>
                                                                <asp:ListItem>  TK:Tokelau  </asp:ListItem>
                                                                <asp:ListItem>  TO:Tonga    </asp:ListItem>
                                                                <asp:ListItem>  TT:Trinidad and Tobago  </asp:ListItem>
                                                                <asp:ListItem>  TN:Tunisia  </asp:ListItem>
                                                                <asp:ListItem>  TR:Turkey   </asp:ListItem>
                                                                <asp:ListItem>  TM:Turkmenistan </asp:ListItem>
                                                                <asp:ListItem>  TC:Turks and Caicos Islands </asp:ListItem>
                                                                <asp:ListItem>  TV:Tuvalu   </asp:ListItem>
                                                                <asp:ListItem>  UG:Uganda   </asp:ListItem>
                                                                <asp:ListItem>  UA:Ukraine  </asp:ListItem>
                                                                <asp:ListItem>  AE:United Arab Emirates </asp:ListItem>
                                                                <asp:ListItem>  GB:United Kingdom   </asp:ListItem>
                                                                <asp:ListItem>  US:United States    </asp:ListItem>
                                                                <asp:ListItem>  UM:United States Minor Outlying Islands </asp:ListItem>
                                                                <asp:ListItem>  UY:Uruguay  </asp:ListItem>
                                                                <asp:ListItem>  UZ:Uzbekistan   </asp:ListItem>
                                                                <asp:ListItem>  VU:Vanuatu  </asp:ListItem>
                                                                <asp:ListItem>  VE:Venezuela    </asp:ListItem>
                                                                <asp:ListItem>  VN:Viet Nam </asp:ListItem>
                                                                <asp:ListItem>  VG:Virgin Islands, British  </asp:ListItem>
                                                                <asp:ListItem>  VI:Virgin Islands, U.S. </asp:ListItem>
                                                                <asp:ListItem>  WF:Wallis and Futuna    </asp:ListItem>
                                                                <asp:ListItem>  EH:Western Sahara   </asp:ListItem>
                                                                <asp:ListItem>  YE:Yemen    </asp:ListItem>
                                                                <asp:ListItem>  ZM:Zambia   </asp:ListItem>
                                                                <asp:ListItem>  ZW:Zimbabwe </asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" CssClass="error" ControlToValidate="Review_country" Display="Dynamic" InitialValue="Please select Country *" ErrorMessage="required" ValidationGroup="review"></asp:RequiredFieldValidator>

                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>State</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_state" runat="server" class="form-control" readonly="readonly" />

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" CssClass="error" ValidationGroup="review" ControlToValidate="Review_state" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>City</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_city" runat="server" class="form-control" readonly="readonly" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" CssClass="error" ValidationGroup="review" ControlToValidate="Review_city" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Pincode</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_pincode" runat="server" class="form-control" readonly="readonly" />
                                                            <asp:RequiredFieldValidator CssClass="error" ValidationGroup="review" ControlToValidate="Review_pincode" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                            </asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <p class="">Review Exam Details </p>
                                                            <asp:LinkButton ID="LBtnedit2" type="button" runat="server" OnClick="LBtn_edit2">Edit</asp:LinkButton>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Exam Name</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_examname" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Exam Code</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_examcode" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Exam Fees</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_examfees" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Exam Registration Number</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_regnumber" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Exam Date</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_examdate" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Exam Time</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_examtime" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                                            <p>
                                                                Review Test Center Details
                                                                <asp:LinkButton ID="LBtnedit3" type="button" runat="server" OnClick="LBtn_edit3">Edit</asp:LinkButton>
                                                            </p>
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Center Name</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_centername" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Center ID</p>
                                                        </div>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <input type="text" id="Review_centerid" runat="server" class="form-control" disabled />
                                                        </div>
                                                        <div class="col-lg-2 col-sm-2">
                                                            <p>Center Address</p>
                                                        </div>
                                                        <div class="col-lg-10 col-sm-10 col-md-10">
                                                            <input type="text" class="form-control" id="Review_centeraddress" runat="server" disabled />
                                                        </div>
                                                        <div class="col-lg-12 col-sm-12 col-md-12">
                                                            <div>
                                                                <asp:CheckBox ID="brand" class="form-check-input" runat="server" Style="margin-left: 0;" Text="I agree to the Terms Conditions and Privacy Policy." OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                                                                <%--<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" style="margin-left: 0;">
                                                                <label class="form-check-label" for="defaultCheck1" style="margin-left: 0.3rem;">
                                                                    I agree to the <span><a href="#">Terms of Use</a> </span>&amp; <span><a href="#">Privacy</a></span>
                                                                </label>--%>
                                                            </div>
                                                            <asp:Label ID="Lbl_check" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                        </div>

                                                    </div>
                                                </div>
                                                <asp:Button ID="update" type="button" runat="server" CssClass="action-button" Text="RE-SCHEDULE EXAM" Width="170px" OnClick="Btn_update" Visible="false"></asp:Button>


                                                <asp:LinkButton ID="next3" type="button" runat="server" CssClass="action-button" ValidationGroup="next3" OnClick="LBtn_next3" Style="padding: 14px 14px;">Next <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                                <asp:LinkButton ID="back3" type="button" runat="server" CssClass="action-button-previous" ValidationGroup="back3" OnClick="LBtn_back3" Style="padding: 14px 14px;"><i class="fa fa-chevron-left" ></i> previous</asp:LinkButton>
                                                <%-- <input type="button" name="previous" class="previous action-button-previous" value="Previous" />--%>

                                                <%-- <input type="button" name="next" class="next action-button" value="Next" />--%>
                                            </fieldset>
                                            <fieldset id="dvVoucherCode" runat="server" clientidmode="Static">
                                                <div class="form-card">
                                                    <div class="row">
                                                        <div class="col-11">
                                                            <h2 class="fs-title">Voucher Code:</h2>
                                                        </div>
                                                        <div class="col-1">
                                                            <h2 class="steps">Step 4 </h2>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-bottom: 3rem;" id="messages" runat="server" clientidmode="Static">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="form-card">
                                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                                    <label class="fieldlabels">Voucher Code:*</label>
                                                                    <input type="text" class="form-control" name="first_name" id="Voucher_code" placeholder="Voucher Code" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" CssClass="error" ValidationGroup="pay" ControlToValidate="Voucher_code" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                                    </asp:RequiredFieldValidator>
                                                                    <asp:Label ID="lblErrMsg" runat="server" CssClass="error" ForeColor="Red" ClientIDMode="Static"></asp:Label>
                                                                    <script type="text/javascript">
                                                                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                                                                        if (prm != null) {
                                                                            prm.add_endRequest(function (sender, e) {
                                                                                if (sender._postBackSettings.panelsToUpdate != null) {
                                                                                    setTimeout(function () {
                                                                                        $('#lblErrMsg').hide();
                                                                                    }, 5000);
                                                                                }
                                                                            });
                                                                        };
                                                                    </script>
                                                                    <%-- <button type="button" class="btn-primary btn-lg" style="background-color: #007388; border-radius: 25px;">pay now</button>--%>
                                                                    <asp:Button ID="pay" type="button" runat="server" Text="Pay" class="btn-primary btn-lg" ValidationGroup="pay" OnClick="Btn_Pay" Style="margin-top: 15px; margin: 0 auto; display: block;" ClientIDMode="Static" />
                                                                </div>

                                                            </div>

                                                        </div>


                                                    </div>


                                                </div>
                                                <input type="text" name="Address" id="RendomCode" runat="server" style="display: none;" clientidmode="Static" />
                                                <%--<asp:LinkButton ID="LB_next3" type="button" runat="server" Enabled="false" CssClass="next action-button" ValidationGroup="next4" Style="padding: 14px 14px;"><i class="fa fa-chevron-right">Submit</i></asp:LinkButton>--%>
                                                <asp:LinkButton ID="LB_back3" type="button" runat="server" class="previous action-button-previous" ValidationGroup="back4" OnClick="LBtn_back4" Style="padding: 14px 14px;"><i class="fa fa-chevron-left">Previous</i></asp:LinkButton>
                                                <%--<input type="button" name="next" class="next action-button" value="Submit" />
                                                <input type="button" name="previous" class="previous action-button-previous" value="Previous" />--%>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--------Reshedule New Exam ------->
                    <div class="content1 student-panel" id="Re_Shedule_Exam" runat="server" clientidmode="Static">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <h1 class="heading">Reshedule New Exam</h1>
                                    <div class="card px-0 pb-0 mb-3">
                                        <h2 id="heading"></h2>
                                        <p class="pstyle">create your Reshedule Exam </p>
                                        <br />
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Exam Name</th>
                                                    <th scope="col">Registeration Number</th>
                                                    <th scope="col">Exam Date</th>
                                                    <th scope="col">Exam Time </th>
                                                    <th scope="col">Exam Status </th>
                                                    <th scope="col">Exam Reshedule</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td scope="row">
                                                                <asp:Label ID="lbl_book_id" runat="server" Text='<%#Eval("book_id") %>' Visible="false" />
                                                                <%#Eval("exam_name") %>
                                                                <%--<img src="img/<%#Eval("ImageUrl") %>" alt="Cloud-computing Certifications" class="img-responsive mt-10">--%></td>
                                                            <td><%#Eval("aadhar_card") %></td>
                                                            <td><%#Eval("exam_date") %></td>
                                                            <td class="date">
                                                                <%#Eval("exam_time") %>
                                                            </td>
                                                            <td class="date">
                                                                <asp:Label ID="lbl_testing_exam_date111" runat="server" Text='<%#Eval("Examstatus").ToString()=="Waiting to get hold of" ? "Not Started" : "" %>' ForeColor='<%# (Eval("Examstatus").Equals("Waiting to get hold of")) ?  System.Drawing.Color.Red : System.Drawing.Color.Green %>' />
                                                            </td>

                                                            <td>
                                                                <p>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Re-Schedule" CommandName="Schedule"></asp:LinkButton>
                                                                </p>
                                                            </td>

                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr id="trEmpty" runat="server" visible="false">
                                                            <td colspan="6" style="text-align: center;">No records found.</td>
                                                        </tr>

                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </tbody>

                                            <spacer></spacer>
                                        </table>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-------Certificate & score Report---------->
                    <div class="content1 student-panel" id="score_report" runat="server" clientidmode="Static">
                        <div class="container">
                            <div class="row">
                                <div class=" col-lg-12 col-md-12 col-sm-12">
                                    <h1 class="heading">Certificate & Score Report </h1>
                                    <div class="card px-0 pb-0 mb-3">
                                        <p class="pstyle">Certaining Congratulates you for acing your examination! Fetch your score report and certificate right here!</p>
                                        <br />
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Exam Name</th>
                                                    <th scope="col">Exam Code</th>
                                                    <th scope="col">Exam Date</th>
                                                    <th scope="col">Exam Time</th>
                                                    <th scope="col">Issue Date</th>
                                                    <th scope="col">Expire Date</th>
                                                    <th scope="col">Report</th>
                                                    <th scope="col">Certificate</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="RepCertificate" runat="server" OnItemCommand="RepDetails_ItemCommand">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td scope="row">
                                                                <asp:Label ID="lblCandidate_name" runat="server" Text='<%# Eval("Candidate_name") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblCertificateNumber" runat="server" Text='<%# Eval("Certificate_Number") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblResult_id" runat="server" Text='<%# Eval("result_id") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblExam_name" runat="server" Text='<%# Eval("Exam_name") %>'></asp:Label>
                                                            </td>
                                                            <td><%# Eval("exam_code") %> </td>
                                                            <td>
                                                                <asp:Label ID="lblexamdate" runat="server" Text='<%# Eval("Exam_date") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <%# Eval("exam_time") %>
                                                            </td>
                                                            <td>
                                                                <%# Eval("Exam_date") %>
                                                            </td>
                                                            <td>
                                                                <%# GetDate(Eval("ExpireTime")) %>
                                                            </td>
                                                            <td>
                                                                <%--<button class="action-button pt-1 pb-1" style="background-color: #087388; border-radius: 25px; color: white;"><i class="fa fa-download" aria-hidden="true">Score Report </i></button>--%>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" class="action-button pt-1 pb-1" CommandName="Select2" ItemStyle-Width="200px" Style="background-color: #087388; border-radius: 25px; color: white; width: 100%;"> <i class="fa fa-download pt-2 pb-2" aria-hidden="true"> Score Report </i></asp:LinkButton>
                                                            </td>
                                                            <td>
                                                                <%-- <button class="action-button pt-1 pb-1" style="background-color: #087388; border-radius: 25px; color: white;"><i class="fa fa-download" aria-hidden="true">Certificate  </i></button>--%>
                                                                <asp:LinkButton ID="LinkButton3" runat="server" class="action-button pt-1 pb-1" CommandName="Select1" Style="background-color: #087388; border-radius: 25px; color: white; width: 100%;" Visible='<%# Eval("Result_Pass_or_Fail").ToString()=="Pass" ? true:false %>'><i class="fa fa-download pt-2 pb-2" aria-hidden="true">Certificate  </i></asp:LinkButton>

                                                            </td>

                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <footertemplate>
                                                            <tr id="trEmpty" runat="server" visible="false">
                                                                <td colspan="6" style="text-align: center;">No records found.</td>
                                                            </tr>

                                                        </footertemplate>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--------Change Password----------->
                    <div class="content1 student-panel mt-5 pt-5" id="Change_password" runat="server" clientidmode="Static">
                        <div class="container mt-5">
                            <h2 class="heading">Change Password  </h2>
                            <p class="pstyle">To create or change your password, you are requested to follow the said procedure in the following manner.   </p>
                            <div class="row d-flex align-items-center justify-content-center">
                                <div class="col-lg-6 col-md-6 col-sm-6 pstyle">
                                    <h1 class="heading text-center">Change Password</h1>
                                    <div class="pstyle">
                                        <div class="msform">
                                            <div class="fourm-card text-center">
                                                <div class="alert alert-danger" id="error_msgchangepassword" runat="server" visible="false" clientidmode="Static">
                                                    <strong>Error ! </strong>Please enter the correct current password.
                                                </div>
                                                <div class="col-md-12 col-lg-12 col-sm-12 justify-content-center">
                                                    <input runat="server" id="txtCurrentPassword" type="Password" name="old Password" style="border-radius: 25px;" placeholder="Enter your Old Password">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" CssClass="error" ValidationGroup="password" ControlToValidate="txtCurrentPassword" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                    </asp:RequiredFieldValidator>
                                                    <input runat="server" id="txtNewPassword" type="Password" name="New Password" style="border-radius: 25px;" clientidmode="Static" placeholder="Enter your New Password" onfocusout="passwordcomplexicity();">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" CssClass="error" ValidationGroup="password" Display="Dynamic" ControlToValidate="txtNewPassword" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                    </asp:RequiredFieldValidator>
                                                    <input runat="server" id="txtConfrimPassword" type="Password" name="Confirm New Password" style="border-radius: 25px;" placeholder="Confirm your New Password">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" CssClass="error" ValidationGroup="password" Display="Dynamic" ControlToValidate="txtConfrimPassword" runat="server" ForeColor="Red" ErrorMessage="Required">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" CssClass="error" ValidationGroup="password" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Both password should be same."
                                                        ControlToValidate="txtConfrimPassword" ControlToCompare="txtNewPassword"></asp:CompareValidator>
                                                    <%-- <input type="password" placeholder="Old placeholder" style="border-radius: 25px;">
                                                    <input type="password" placeholder="New placeholder" style="border-radius: 25px;">
                                                    <input type="password" placeholder="Retype New placeholder" style="border-radius: 25px;">--%>
                                                    <%--<button class="nav-links pt-2 pb-2 pr-2 pl-4 m-3 active" style="background-color: #007388; width: 100%; border-radius: 22px;" id="nav-Mission-tab" data-bs-toggle="tab" data-bs-target="#Mission" type="button" role="tab" aria-controls="nav-Mission-tab" aria-selected="true">
                                                        <span style="color: white;" class="pt-5">Submit                                        </span>
                                                    </button>--%>
                                                    <asp:Button ID="btnSave" class="nav-links pt-2 pb-2 pr-2 pl-4 m-3 active" Style="background-color: #007388; width: 100%; border-radius: 22px;" runat="server" Text="Update" ValidationGroup="password" OnClick="btnSave_Click" CssClass="button-validate" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
                <!------Support--------->
                <div class="content1 student-panel pt-5 student-panel" id="support" runat="server" clientidmode="Static">
                    <div class="container mt-5 pt-5">
                        <h2 class="heading">Support </h2>
                        <p class="pstyle">Confused or have some unresolved queries? We will be happy to assist you! Click on the icon below and we'll resolve your queries!  </p>
                        <div class="row d-flex align-items-center justify-content-center">
                            <div class="col-lg-6 col-md-6 col-sm-6 pstyle">
                                <h1 class="heading text-center">Support</h1>
                                <div class="pstyle">
                                    <div class="msform">
                                        <div class="fourm-card text-center">
                                            <div class="alert alert-success" id="support_message" runat="server" visible="false" clientidmode="Static">
                                                Your message has been sent Successfully !!. 
                                            </div>
                                            <div class="col-md-12 col-lg-12 col-sm-12 justify-content-center">
                                                <%--<input type="password" placeholder="Subject" style="border-radius: 25px;">--%>
                                                <textarea id="txt_subject" name="Message" rows="1" style="border-radius: 25px;" placeholder="Enter Your Subject" runat="server"></textarea>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" CssClass="error" ValidationGroup="support" ControlToValidate="txt_subject" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <%-- <textarea name="" id="" style="border: 1px solid #007388; border-radius: 25px;" placeholder="Enter Your Message"></textarea>--%>
                                                <textarea id="txt_message" name="Message" rows="6" placeholder="Enter Your Message" runat="server"></textarea>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" CssClass="error" ValidationGroup="support" ControlToValidate="txt_message" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <%--<button class="nav-links pt-2 pb-2 pr-2 pl-4 m-3 active" style="background-color: #007388; width: 100%; border-radius: 22px;" id="nav-Mission-tab" data-bs-toggle="tab" data-bs-target="#Mission" type="button" role="tab" aria-controls="nav-Mission-tab" aria-selected="true">
                                                    <span style="color: white;" class="pt-5">Submit     </span>
                                                </button>--%>
                                                <asp:Button ID="btn_submit" class="nav-links pt-2 pb-2 pr-2 pl-4 m-3 active" Style="background-color: #007388; width: 100%; border-radius: 22px;" ValidationGroup="support" runat="server" Text="Submit" OnClick="sent_support" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <!-------Logout---------->
                <div class="student-panel">
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Aliquid possimus molestiae tempore suscipit nisi tempora saepe ipsa dolorum a ipsam nemo, culpa vitae doloribus quos, maxime et laudantium exercitationem aspernatur eos voluptatum distinctio. Ea voluptate quasi deserunt itaque commodi, odit vero veniam corporis in exercitationem dolorem architecto ex nihil aut et sint omnis suscipit quaerat! Deserunt a illo quam provident doloremque officia, optio similique? A labore molestias autem dolorum porro, recusandae mollitia quidem asperiores quibusdam laboriosam nisi officia sit deleniti accusantium ducimus illo ipsam beatae explicabo possimus quod unde cumque itaque id. Id magnam eaque culpa natus ipsum consequuntur laboriosam incidunt blanditiis obcaecati quo enim, quibusdam magni perferendis omnis quos perspiciatis fuga cupiditate velit porro assumenda iusto doloribus dolores temporibus. Doloremque itaque in earum molestiae, atque dolor aliquam ex eligendi, id voluptatibus incidunt assumenda aliquid aperiam inventore qui quisquam accusamus officia reiciendis reprehenderit nam sed rerum magni. Sed possimus, culpa aspernatur, saepe nobis obcaecati ullam voluptates odio eos dolor ipsum consequatur molestias perferendis blanditiis! Dolores iusto illum magnam facilis aspernatur voluptates ex recusandae iure obcaecati ullam? Quas eum eaque quibusdam ducimus error, neque earum dignissimos voluptatibus quaerat dolores ipsa nesciunt consequatur dicta quos assumenda sed, perferendis ad accusantium rerum obcaecati repellat, totam iure culpa? Non amet magnam, eos doloremque provident qui odit at esse cumque aliquid error impedit temporibus deleniti consequuntur nulla suscipit corrupti distinctio. Ea cupiditate excepturi deleniti dolorem mollitia. Nihil voluptate suscipit corporis modi dolores. Consequuntur, fuga ut. Delectus dolore facere veritatis reiciendis tempora ullam pariatur facilis, illum, rerum quos vel nesciunt atque suscipit laudantium eligendi nihil assumenda impedit inventore rem. Delectus nam aperiam earum, dolor sapiente adipisci, minus magnam vel provident quam inventore, repellendus asperiores accusantium est error! Aliquid dolor laboriosam, quidem tempora, similique, eaque rerum nulla voluptatem aspernatur praesentium consequuntur voluptas quas molestias necessitatibus eum velit.</p>
                </div>
            </section>
            <div id="messege_reshedule" class="modal fade" role="dialog" runat="server">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button ID="Button3" class="close1" runat="server" Text="×" Style="padding: 0px 9px 4px 9px; color: white; opacity: 1; float: right; background-color: red; font-weight: 400;" OnClick="Btn_CloseReschedule" />
                        </div>
                        <div class="modal-body">
                            <div id="Div5">
                                <div class="check_mark">
                                    <div class="sa-icon sa-success animate">
                                        <span class="sa-line sa-tip animateSuccessTip"></span>
                                        <span class="sa-line sa-long animateSuccessLong"></span>
                                        <div class="sa-placeholder"></div>
                                        <div class="sa-fix"></div>
                                    </div>
                                </div>
                                <p>
                                    <center>Your exam has been Re-scheduled successfully.</center>
                                    <center style="color: #76df3e;">Thank You</center>
                                </p>
                            </div>

                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <div id="message_seccess" class="modal fade" role="dialog" runat="server" style="opacity: 3">
                <div class="modal-dialog modal-sm">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button ID="Button18" class="cross" runat="server" Text="X" OnClick="Btn_Closeschedule" />

                        </div>
                        <div class="modal-body">
                            <div id="dvCheck">
                                <div class="check_mark">
                                    <div class="sa-icon sa-success animate">
                                        <span class="sa-line sa-tip animateSuccessTip"></span>
                                        <span class="sa-line sa-long animateSuccessLong"></span>
                                        <div class="sa-placeholder"></div>
                                        <div class="sa-fix"></div>
                                    </div>
                                </div>
                                <div style="margin: 0 auto; display: block; text-align: center;">
                                    <h6 class="mb-10">Your Exam has been booked</h6>
                                    <asp:Button ID="Button5" class="button-validate" runat="server" Text="Schedule New Exam" OnClick="Btn_newexam" />
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <asp:Label ID="Lbl_exam1" runat="server" ClientIDMode="Static" Text="" Style="display: none;"></asp:Label>
            <div class="modal fade" id="errorModal" runat="server" clientidmode="Static" style="opacity: 3">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 10rem;">
                        <div class="modal-header">
                            <asp:Button ID="Button19" class="cross" runat="server" Text="X" data-dismiss="modal" OnClientClick="scrollopen();" />
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <h5 style="text-align: center;">Please select exam to proceed</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="popupselectexam">
                <div class="modal fade" id="myModal12" runat="server" clientidmode="Static">
                    <div class="modal-dialog">
                        <div class="modal-content" style="margin-top: 10rem;">
                            <div class="modal-header">
                                <h5 class="modal-title" id="test_center" runat="server" clientidmode="Static"></h5>
                                <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                                <asp:Button ID="Button1" class="cross" runat="server" Text="X" OnClick="Btn_Close" data-dismiss="modal" />
                            </div>

                            <!-- Modal Body -->
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <p>Select Date</p>
                                        </div>
                                        <div class="col-8">
                                            <asp:TextBox ID="DateTextBox" Placeholder="Click Here to Select the Date" runat="server" CssClass="form-control" OnTextChanged="select_time" AutoPostBack="true" Style="cursor: pointer;" autocomplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="error1" ID="RequiredFieldValidator16" ValidationGroup="savetime" ControlToValidate="DateTextBox" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row" id="hide_time">
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <p>
                                                Available Time Slots (Select One)                       
                                        </div>
                                        <div class="col-md-8" style="margin-bottom: 11px; display: block; display: ruby;">
                                            <asp:Repeater ID="RepDetails_Morning" runat="server">
                                                <ItemTemplate>
                                                    <div class='inline'>
                                                        <asp:Button ID="Btn_time" class="btn-time-select" runat="server" Text='<%#Eval("StartTime")%>' OnClick="btn_Select" />

                                                    </div>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%--<select name="" id="" class="btn btn-primary" aria-placeholder="select your time">
     <option value="" disabled selected>Select Your Time</option>
     <option value="">9:00 am</option>
     <option value="">10:00 am</option>
     <option value="">11:00 am</option>
     <option value="">12:00 am</option>
     <option value="">01:00 pm</option>
     <option value="">02:00 pm</option>
     <option value="">03:00 pm</option>
     <option value="">04:00 pm</option>
 </select>--%>
                                        </div>
                                        <div class="col-12">
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                                            <asp:Button ID="Btn_timesave" class="btn btn-success" Width="75px" Style="margin-bottom: 2px;" runat="server" Text="Save" ValidationGroup="savetime" data-dismiss="modal" OnClick="Btn_SaveTime" />
                                            <%--<button type="button" class="btn btn-primary " data-bs-dismiss="modal" aria-label="Close" style="float: right;">Save changes </button>--%>
                                        </div>
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal Footer -->


                </div>
            </div>
            <%-- </div>--%>
            <!-----modal view details--------->
            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server" clientidmode="Static" style="margin-top: 82px;">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h5 class="modal-title text-center" id="hName"></h5>
                            <%-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                            <asp:Button ID="Button4" class="btn-close" data-bs-dismiss="modal" aria-label="Close" runat="server" Text="X" Style="width: 10px" OnClick="Btn_Close" data-dismiss="modal" />
                            <%--<p id="lbl_centername" class="modal-title title-center">
                 </p>--%>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-10">
                                        <p id="pAddress"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <i class="fa fa-envelope fa-2x" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <p id="pEmailId"></p>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <i class="fa fa-phone fa-2x" aria-hidden="true"></i>

                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <p id="pPhone"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <i class="fa fa-globe fa-2x" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <p id="pWebsite">
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>

                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <p id="pLocation">
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-6 ">
                                        <i class="fa fa-users fa-2x" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <p id="pOnlineOffiline">
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Footer -->


            </div>


        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function scrollopen() {
            document.body.style.overflow = 'auto';
            // document.querySelector('.modal-open').style.overflow = 'auto';
        }
        function scrollclose() {
            document.body.style.overflow = 'hidden';
            // document.querySelector('.modal-open').style.overflow = 'auto';
        }
        function FillCenterData(id) {
            //let popup = document.getElementById("popup-form");
            //popup.classList.toggle("show-popup");
            $.ajax({
                url: 'find-testing-center.aspx/GetCenterDetails',
                dataType: "json",
                type: "POST",
                async: false,
                contentType: "application/json; charset=utf-8",
                data: "{'strCenterID':'" + id + "'}",
                success: function (data) {
                    // $("#lbl_centername").text(data.d[0].center_name);
                    $("#hName").text(data.d[0].center_name);
                    $("#pAddress").text(data.d[0].Owner_Address);
                    $("#pEmailId").text(data.d[0].Owner_Email);
                    $("#pPhone").text(data.d[0].Owner_Phone_Number);
                    $("#pWebsite").text(data.d[0].Country);
                    $("#pLocation").text(data.d[0].City);
                    $("#pOnlineOffiline").text(data.d[0].Pincode);
                },
                error: function () {
                    SetDialogMessage('Something went wrong.', 'false');
                }
            });
        }
        function SetDateTimePicker(centerId, centername) {
            scrollclose();
            if ($("#ddlExam option:selected").val() != -1) {
                SetDatePicker(centerId, centername);
            }
            else {
                // SetDialogMessage("Please select exam to proceed.", 'false');
                $("#errorModal").addClass("modal fade in");
                $("#errorModal").css("display", "block");
                $('#popupselectexam').attr('style', 'display: none');
                return false;
            }

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function (sender, e) {
                    if (sender._postBackSettings.panelsToUpdate != null) {
                        $(".datepicker-orient-bottom").hide();
                    }
                });
            };

        }

        function SetDatePicker(centerId, centername) {
            $("#test_center").html(centername);
            $('#hide_time').hide();
            $('#error_msg1').hide();
            var Dates = [];
            var WeekEnds = [];
            var Maxdate = '';
            $.ajax({
                url: "dashboard.aspx/GetCenterDateTime",
                data: "{'strCenterId':'" + centerId + "','strCenterName':'" + centername + "'}",
                dataType: "json",
                type: "POST",
                async: false,
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d.length == 0) {
                        alert('Sorry for inconvenience, Something went wrong.', 'false');
                    }
                    else {
                        Dates = data.d[0].Dates.split(',');
                        WeekEnds = data.d[0].WeekEnds.split(',');
                        Maxdate = data.d[0].MaxDate;
                        SetDatePickerOption(Dates, WeekEnds, Maxdate);
                    }
                },
                error: function () {
                }
            });
        }

        function SetDatePickerOption(Dates, WeekEnds, Maxdate) {
            var minDate = new Date();
            $.ajax({
                url: "dashboard.aspx/GetDateNow",
                dataType: "json",
                type: "POST",
                async: false,
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    minDate = data.d;
                },
                error: function () {
                    minDate = new Date();
                }
            });

            $('#<%=DateTextBox.ClientID %>').datepicker({
                minDate: minDate,
                dateFormat: 'dd-MM-yy',
                maxDate: Maxdate,
                setDate: minDate,
                beforeShowDay: function (date) {
                    var string = jQuery.datepicker.formatDate('dd-MM-yy', date);
                    return [Dates.indexOf(string) == -1 && WeekEnds.indexOf(date.getDay().toString()) == -1]
                }

            });
        }
    </script>
</asp:Content>
