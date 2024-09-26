<%@page import="dao.Users"%>
<%
    Users user = (Users) session.getAttribute("user");
    if (user == null) {
        request.getRequestDispatcher("/logIn.jsp").forward(request, response);
    }
%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="https://htmljstemplates.com/static_files/images/favicon.png" />

        <link href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/navbars/navbar-1/assets/css/navbar-1.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <style>
            a {
                font-family: 'Darker Grotesque', sans-serif;
                font-size: 20px;
                text-decoration: none;
            }

            .lavish {
                font-family: 'Lavishly Yours', cursive;
            }

            .customSubMenuHolder:hover>.customSubMenu {
                display: block
            }

            .customSubMenu {
                display: none;
                box-shadow: 2px 8px 12px rgba(0, 0, 0, 0.5);
                position: absolute;
                width: 100%;
                left: 0;
                background: #00354b;
            }

            img {
                width: 100%;
            }

            .cart-link,
            .login-link {
                font-size: 1.5rem;
                /* Adjust font size as needed */
                padding: 0.5rem;
                /* Adjust padding as needed */
            }

            .cart-link svg,
            .login-link svg {
                width: 24px;
                /* Adjust SVG width as needed */
                height: 24px;
                /* Adjust SVG height as needed */
            }

            .cart-link {
                font-size: 1.5rem;
                padding: 0.5rem;
                border: 1px solid #0f83589c;
                border-radius: 23px;
                transition: none;
                display: inline-flex;
                align-items: center;
            }

            .cart-link svg {
                width: 24px;
                /* Adjust SVG width as needed */
                height: 24px;
                /* Adjust SVG height as needed */
                transition: all 0.3s ease;
                /* Smooth transition for hover effect */
            }

            .cart-link:hover {
                fill: #fff;
                background: linear-gradient(45deg, yellow, green);
                /* Gradient background on hover */
                border: none;
                /* Make border transparent to show gradient properly */
            }

            .cart-link:hover svg {
                /*  fill: #fff; Change SVG color on hover */
            }

            /* Optional: Add similar styles for the login-link if needed */
            .login-link {
                margin-right: 60px;
                border: 1px solid #0f83589c;
                border-radius: 23px;
                font-size: 1.5rem;
                /* Adjust font size as needed */
                padding: 0.5rem;
                /* Adjust padding as needed */
                border-radius: 23px;
                /* Optional: rounded corners */
                transition: all 0.3s ease;
                /* Smooth transition for hover effect */
                display: inline-flex;
                align-items: center;
            }

            .login-link svg {
                width: 24px;
                /* Adjust SVG width as needed */
                height: 24px;
                /* Adjust SVG height as needed */
                transition: all 0.3s ease;
                /* Smooth transition for hover effect */
            }

            .login-link:hover {
                fill: #fff;
                background: linear-gradient(45deg, red, #ff9999);
                /* Gradient background on hover */
                border: none;
                /* Make border transparent to show gradient properly */
            }
            .edit {
                color: green; /* Set the color to green for the edit icon */
                cursor: pointer; /* Change cursor to pointer on hover */
            }

            .delete {
                color: red; /* Set the color to red for the delete icon */
                cursor: pointer; /* Change cursor to pointer on hover */
            }
            .act{
                display: flex;
                justify-content: space-around;
            }
        </style>

        <title>Dashboard</title>

    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom px-2">
            <a class="navbar-brand" href="#" style="min-width:180px">
                <img style="height:114px" src="assets/images/logo.png" alt="new logo" />
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ms-auto d-none d-lg-inline-flex">
                    <li class="nav-item mx-2">
                        <a class="nav-link cart-link" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                            </svg>
                            <span data-bs-toggle="modal" data-bs-target="#exampleModal2" class="ms-1 align-middle">Add New Book</span>
                        </a>
                    </li>
                    <li class="nav-item mx-2 dropdown">
                        <a class="nav-link login-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                            </svg>
                            <span class="ms-1 align-texttop"><%=user.getUsername()%></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="KillSession">Log out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid p-4">
            <div class="row">
                <div class="col">
                    <div class="row header" style="text-align:center;color:green">
                        <h3>CRUD Operations On Books Table</h3>
                    </div>
                    <div class="table-responsive">
                        <table id="example" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Book ID</th>
                                    <th>Book title</th>
                                    <th>Author</th>
                                    <th>Book Description</th>
                                    <th>Price</th>
                                    <th>Published Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>



        <!-- Modal for Update  -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modify Book Info</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="updateForm">
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input readonly type="text" name="bookID" id="bookID" class="form-control"/>
                                <label class="form-label" for="bookID">Book ID</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" name="bookTitle" id="bookTitle" class="form-control" />
                                <label class="form-label" for="bookTitle">Book Title</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" name="author" id="author" class="form-control" />
                                <label class="form-label" for="author">Author</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <textarea name="bookDesc" class="form-control" id="bookDesc" rows="3"></textarea>
                                <label class="form-label" for="bookDesc">Book Description</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="number" id="price" name="price" class="form-control" />
                                <label class="form-label" for="price">Price</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="date" id="publishedDate" name="publishedDate" class="form-control" />
                                <label class="form-label" for="publishedDate">Published Date</label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Delete  -->
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">               
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Are you sure ?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="deleteForm">                            
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="text" name="idb" id="idb" class="form-control" hidden/>
                        </div> 
                        <div class="modal-body">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                            <button type="submit" class="btn btn-success">Yes</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- model for Adding product -->

        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Add your Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addForm">
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" name="bookTitle" id="bookTitle" class="form-control" />
                                <label class="form-label" for="bookTitle">Book Title</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" name="author" id="author" class="form-control" />
                                <label class="form-label" for="author">Author</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <textarea name="bookDesc" class="form-control" id="bookDesc" rows="3"></textarea>
                                <label class="form-label" for="bookDesc">Book Description</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="number" id="price" name="price" class="form-control" />
                                <label class="form-label" for="price">Price</label>
                            </div>
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="date" id="publishedDate" name="publishedDate" class="form-control" />
                                <label class="form-label" for="publishedDate">Published Date</label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </body>
    <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var dataTable = $('#example').DataTable(); // Initialize DataTables once

            loadData(); // Call the function to load data initially

            // Function to load data using AJAX
            function loadData() {
                $.ajax({
                    url: 'getBookServlet', // URL of your servlet
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        // Clear existing table rows
                        dataTable.clear().draw();

                        // Populate table with new data
                        $.each(data, function (index, book) {
                            dataTable.row.add([
                                book.id,
                                book.title,
                                book.author,
                                book.description,
                                book.price,
                                book.publishedDate,
                                '<div class="act">' +
                                        '<a class="edit" title="Edit" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="material-icons">&#xE254;</i></a>' +
                                        '<a class="delete" title="Delete" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="material-icons">&#xE872;</i></a>' +
                                        '</div>'
                            ]).draw();
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error:', errorThrown);
                    }
                });
            }

            // Function to handle click on edit icon
            $('#example tbody').on('click', '.edit', function () {
                // Get the closest row to the clicked icon
                var row = $(this).closest('tr');

                // Get the data from the row
                var bookID = row.find('td:eq(0)').text();
                var bookTitle = row.find('td:eq(1)').text();
                var author = row.find('td:eq(2)').text();
                var bookDesc = row.find('td:eq(3)').text();
                var price = row.find('td:eq(4)').text();
                var publishedDateText = row.find('td:eq(5)').text();

                // Convert the date format from "MMM DD, YYYY" to "YYYY-MM-DD"
                var publishedDate = formatDate(publishedDateText);

                // Set the values in the modal form
                $('#bookID').val(bookID);
                $('#bookTitle').val(bookTitle);
                $('#author').val(author);
                $('#bookDesc').val(bookDesc);
                $('#price').val(price);
                $('#publishedDate').val(publishedDate);

                // Open the modal
                $('#exampleModal').modal('show');
            });

            // Function to format the date from "MMM DD, YYYY" to "YYYY-MM-DD"
            function formatDate(dateString) {
                var parts = dateString.split(' ');
                var month = parts[0];
                var day = parts[1].replace(',', '');
                var year = parts[2];

                // Convert month name to month number
                var monthNumber = new Date(Date.parse(month + ' 1, 2000')).getMonth() + 1;

                // Ensure day and month are formatted with leading zeros if needed
                day = day.padStart(2, '0');
                monthNumber = monthNumber.toString().padStart(2, '0');

                return year + '-' + monthNumber + '-' + day;
            }

            // Function to handle click on delete icon
            $('#example tbody').on('click', '.delete', function () {
                // Get the closest row to the clicked icon
                var row = $(this).closest('tr');

                // Get the data from the row
                var bookid = row.find('td:eq(0)').text();

                // Set the values in the modal form
                $('#idb').val(bookid);
                // Open the modal
                $('#exampleModal1').modal('show');
            });

            $('#updateForm').submit(function (event) {
                event.preventDefault(); // Prevent default form submission
                var formData = $(this).serialize(); // Serialize form data

                $.ajax({
                    url: 'updateServlet', // URL of your servlet for updating
                    type: 'POST',
                    data: formData,
                    success: function (response) {
                        if (response.success) {
                            // If update is successful, reload the table data
                            loadData();
                            $('#exampleModal').modal('hide'); // Hide the modal
                        } else {
                            console.log('Error:', response.error);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error:', errorThrown);
                    }
                });
            });
            $('#addForm').submit(function (event) {
                event.preventDefault(); // Prevent default form submission
                var formData = $(this).serialize(); // Serialize form data

                $.ajax({
                    url: 'addServlet', // URL of your servlet for Adding
                    type: 'POST',
                    data: formData,
                    dataType: 'json', // Expect JSON response
                    success: function (response) {
                        if (response.success) {
                            // If add is successful, reload the table data
                            loadData();
                            $('#exampleModal2').modal('hide'); // Hide the modal
                        } else {
                            console.log('Error:', response.error);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error:', errorThrown);
                    }
                });
            });

            $('#deleteForm').submit(function (event) {
                event.preventDefault(); // Prevent default form submission
                var formData = $(this).serialize(); // Serialize form data

                $.ajax({
                    url: 'deleteServlet', // URL of your servlet for deletion
                    type: 'POST',
                    data: formData,
                    dataType: 'json', // Expect JSON response
                    success: function (response) {
                        console.log('Response:', response); // Debugging line
                        if (response.success) {
                            console.log('Delete successful'); // Debugging line
                            loadData();
                            $('#exampleModal1').modal('hide'); // Hide the modal
                        } else {
                            console.log('Error:', response.error);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error:', errorThrown);
                    }
                });
            });


        });

    </script>




</html>
