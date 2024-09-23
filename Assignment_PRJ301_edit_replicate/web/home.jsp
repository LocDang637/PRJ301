<%-- 
    Document   : home
    Created on : Jan 21, 2024, 11:41:20 AM
    Author     : ptd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Home Page</title>
        <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background-color: #b2e0df;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            /*            body{
                            margin: 0;
                            padding: 0;
                            background-color: #b2e0df;
                            height: 100vh;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                        }*/

            .search-container{

                margin-top: 2rem;
                width: 300px;
                background: #fff;
                height: 30px;
                border-radius: 30px;
                padding: 10px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                transition: 0.8s;
                /*box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
                inset -7px -7px 10px 0px rgba(0,0,0,.1),
               7px 7px 20px 0px rgba(0,0,0,.1),
               4px 4px 5px 0px rgba(0,0,0,.1);
               text-shadow:  0px 0px 6px rgba(255,255,255,.3),
                          -4px -4px 6px rgba(116, 125, 136, .2);
              text-shadow: 2px 2px 3px rgba(255,255,255,0.5);*/
                box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
                    -4px -4px 6px 0 rgba(116, 125, 136, .2),
                    inset -4px -4px 6px 0 rgba(255,255,255,.2),
                    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
            }

            .search-container:hover > .search-input{
                width: 400px;
            }

            .search-container .search-input{
                background: transparent;
                border: none;
                outline:none;
                width: 0px;
                font-weight: 500;
                font-size: 16px;
                transition: 0.8s;

            }

            .search-container .search-btn .fas{
                color: #5cbdbb;
            }

            @keyframes hoverShake {
                0% {
                    transform: skew(0deg,0deg);
                }
                25% {
                    transform: skew(5deg, 5deg);
                }
                75% {
                    transform: skew(-5deg, -5deg);
                }
                100% {
                    transform: skew(0deg,0deg);
                }
            }

            .search-container:hover{
                animation: hoverShake 0.15s linear 3;
            }

            /* The Modal (background) */
            #mobileDetailModal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* The Modal (background) */
            #addToCartModal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
                max-width: 600px; /* Maximum width */
            }

            /* The Close Button */
            .close-button {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close-button:hover,
            .close-button:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .clickable-row{
                cursor: pointer;
            }

            .error-message {
                color: red;
                text-align: center;
                /*            font-weight: bold;
                            font-size: 18px;
                            margin-top: 20px;*/
            }

            /*            .error-message-adding {
                        color: red;
                        text-align: center;
                        font-weight: bold;
                        font-size: 18px;
                        margin-top: 20px;
                    }*/
            
            /* Style for shoe image container */
.shoe-image-container {
    position: relative;
    width: 250px;
    height: 150px;
    overflow: hidden;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* Style for shoe image */
.shoe-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease-in-out;
}

/* Hover effect for shoe image */
.shoe-image-container:hover .shoe-image {
    transform: scale(1.05);
}

/* Style for shoes info */
.shoes-info {
    vertical-align: middle;
    font-size: 16px;
}

/* Style for add to cart button */
.quantity-button-adding {
    background-color: #5cbdbb;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 8px 15px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
}

.quantity-button-adding:hover {
    background-color: #4ca8a6;
}

/* FontAwesome icon style */
.quantity-button-adding i {
    margin-right: 5px;
}



 /* Add animation */
    .image-container {
        transition: transform 0.3s ease-in-out;
    }

    /* Add hover effect */
    .image-container:hover {
        transform: scale(1.05);
    }
    
    /* Đưa modal lên góc phải */
    
    
      .view-cart-btn {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            /* Căn chỉnh nút lên góc phải */
            background-color: #007bff;
            /* Màu nền của nút */
            color: #fff;
            /* Màu chữ của nút */
            padding: 10px 20px;
            /* Kích thước của nút */
            border: none;
            /* Loại bỏ viền */
            border-radius: 5px;
            /* Bo tròn góc */
            cursor: pointer;
            /* Con trỏ chuột khi di chuột qua nút */
        }

        .view-cart-btn:hover {
            background-color: #0056b3;
            /* Màu nền của nút khi di chuột qua */
        }
        
        
        
        
        body {
    color: #333; /* Thay đổi màu chữ sang màu đen */
    background-color: #f8f9fa; /* Thay đổi màu nền sang màu ghi */
    font-family: 'Roboto', sans-serif; /* Thay đổi font chữ */
    font-size: 16px;
    line-height: 1.6;
}

.btn {
    border-radius: 25px; /* Bo tròn góc nút */
    padding: 12px 24px;
    font-size: 18px;
    transition: all 0.3s ease;
}

.btn-primary {
    background-color: #5cb85c; /* Màu nền cho nút primary */
    border-color: #5cb85c; /* Màu viền cho nút primary */
    color: #fff; /* Màu chữ cho nút primary */
}

.btn-primary:hover {
    background-color: #4cae4c; /* Màu nền khi hover */
    border-color: #4cae4c; /* Màu viền khi hover */
}

.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
    transition: box-shadow 0.3s ease;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Hiệu ứng bóng đổ khi hover */
}




/*---dong nay la la CSS CHO HEADING WEBSITE*/

body {
    font-family: 'Roboto', sans-serif; /* Use a luxurious font */
    background-color: #f8f8f8; /* Background color for the page */
    margin: 0;
    padding: 0;
}

.luxury-heading {
    text-align: center;
    font-size: 36px;
    color: #333; /* Adjust the color to fit your website's design */
    margin-bottom: 20px; /* Add some space below the heading */
    position: relative; /* Position for the animation */
}

.luxury-heading a {
    color: #5cb85c; /* Adjust the color of the logout link */
    text-decoration: none; /* Remove underline */
    transition: color 0.3s ease; /* Smooth transition for color change */
}

.luxury-heading a:hover {
    color: #4cae4c; /* Adjust the hover color */
}

.luxury-form-container {
    width: 100%;
    display: flex;
    justify-content: center;
}

.luxury-form {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

.luxury-input {
    border-radius: 20px;
    padding: 8px;
    width: 300px;
    margin: 5px;
    border: 1px solid #ccc; /* Add a border for input fields */
}

.luxury-button {
    border-radius: 20px;
    padding: 8px 20px;
    background-color: #5cb85c; /* Adjust the background color of the button */
    color: #fff; /* Text color for the button */
    border: none; /* Remove border */
    margin: 5px;
    cursor: pointer; /* Add pointer cursor on hover */
    transition: background-color 0.3s ease; /* Smooth transition for color change */
}

.luxury-button:hover {
    background-color: #4cae4c; /* Adjust the hover background color */
}




        </style>


    </head>
    <body>
        <h1 class="luxury-heading">Hello ${sessionScope.ACCOUNT.fullName}, <a href="MainController?action=Logout">Logout</a></h1>

<div class="luxury-form-container">
    <form action="MainController" class="luxury-form">
        <input type="number" name="minPrice" placeholder="Min price..." class="luxury-input" value="${param.minPrice}">
        <input type="number" name="maxPrice" placeholder="Max price..." class="luxury-input" value="${param.maxPrice}">
        <input type="submit" name="action" value="Lookup" class="luxury-button"/>
    </form>
</div>
        <div class="container-xl">
            <div class="table-responsive">
<div class="container-xl">
    <div class="row">
        <h3 class="section-title">Featured Shoes</h3>
    </div>
    <div class="row">
        <c:forEach items="${sessionScope.SHOES_DATA}" var="m">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100 shoe-card">
                    <div class="image-container clickable-row" 
                         data-mobile-id="${m.shoesId}" 
                         data-mobile-name="${m.shoesName}" 
                         data-description="${m.description}"
                         data-price="${m.price}" 
                         data-year-of-production="${m.yearOfProduction}" 
                         data-quantity="${m.quantity}" 
                         data-not-sale="${m.notSale}" 
                         data-image="${m.image}">
                        <img src="./asset/image/${m.image}" class="card-img-top" alt="Shoe Image">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${m.shoesName}</h5>
                        <p class="card-text">${m.shoesId}</p>
                        <p class="card-text">${m.description}</p>
                        <input type="submit" class="btn btn-outline-success quantity-button-adding" value="Add to cart" data-mobile-cart-id="${m.shoesId}" />
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
                

<!-- Icon to trigger view cart modal -->
<div class="view-cart-icon" style="position: fixed; top: 20px; right: 20px;">
    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#cartModal">
        <i class="fas fa-shopping-cart"></i> View Cart
    </button>
</div>

<!-- Modal for viewing cart data -->
<div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cartModalLabel">Shopping Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Cart No.</th>
                                    <th>User Id</th>
                                    <th>Shoes Id</th>
                                    <th>Quantity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Iterate over cart items -->
                                <c:forEach items="${sessionScope.CARTS}" var="m" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${m.userId}</td>
                                        <td>${m.shoesId}</td>
                                        <td>${m.quantity}</td>
                                        <td>
                                            <!-- Button to trigger the modal -->
                                            <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#quantityModal${counter.count}" style="width: 150px;">
                                                Remove To Cart
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for each row -->
<c:forEach items="${sessionScope.CARTS}" var="m" varStatus="counter">
    <div class="modal fade" id="quantityModal${counter.count}" tabindex="-1" role="dialog" aria-labelledby="quantityModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="quantityModalLabel">Enter Quantity</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="MainController" method="POST">
                        <input type="hidden" name="cartId" value="${m.cartId}"/>
                        <label for="quantityInput">Quantity:</label>
                        <input type="number" name="quantity" id="quantityInput" class="form-control" required/>
                        <br>
                        <button type="submit" name="action" value="Remove To Cart" class="btn btn-outline-danger btn-block">Remove To Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:forEach>




        </div>
        <!-- The Modal --> <!--BẢNG NÀY LÀ BẢNG HIỆN THỊ INFO SHOES KHI TA CLICK VÀO HÌNH -->
        <div id="mobileDetailModal" style="display:none;">
            <div class="modal-content">
                <span class="close-button">&times;</span>
                <h2 id="modalShoesName">Shoes Name</h2>
                <!--<img id="modalImage" alt="Shoes Image" style="width: 100px; height: 100px">-->
                <p><b>Description: </b><span id="modalDescription"></span></p>
                <p id="modalDetails"><b>Price: </b><span id="modalPrice"></span><br>
                    <b>Year of Production: </b><span id="modalYearOfProduction"></span><br>
                    <b>Quantity: </b><span id="modalQuantity"></span><br>
                    <b>Not Sale: </b><span id="modalNotSale"></span>
                </p
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div id="addToCartModal" style="display:none;">
        <div class="modal-content">
            <span class="close-button-quantity">&times;</span>
            <h2>Add to Cart</h2>
            <form method="POST" action="MainController">
                <!--<img id="modalImage" alt="Shoes Image" style="width: 100px; height: 100px">-->
                <label for="quantity">Quantity:</label>
                <input type="number" id="cartQuantity" name="quantity" min="1">
                <input type="hidden" id="cartShoesId" name="shoesId">
                <input type="submit" class="btn btn-primary" name="action" value="Add To Cart" />
            </form>
        </div>
    </div>
    <!-- ERROR MESSAGE CỦA ADDING TO CART -->
    <!--     <div id="errorMessage" class="error-message-adding" style="display: none;"></div>-->


</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    if (${requestScope.POSITIVE_NUMBER_ERROR != null}) {
        swal({
            title: "Opps!",
            text: '${requestScope.POSITIVE_NUMBER_ERROR}',
            icon: "error",
            button: "Ok"
        });
    }
    if (${requestScope.QUANTITY_ERROR != null}) {
        swal({
            title: "Opps!",
            text: '${requestScope.QUANTITY_ERROR}',
            icon: "error",
            button: "Ok"
        });
    }
    if (${requestScope.INVALID_RANGE != null}) {
        swal({
            title: "Opps!",
            text: '${requestScope.INVALID_RANGE}',
            icon: "error",
            button: "Ok"
        });
    }
</script>
<script>
    function displayErrorMessage(message) {
        var errorMessageDiv = document.getElementById("errorMessage");
        errorMessageDiv.innerHTML = message;
        errorMessageDiv.style.display = "block";
    }
</script>
<script>
    var quantityError = "<%= request.getAttribute("QUANTITY_ERROR")%>";
    if (quantityError && quantityError.trim() !== "") {
        displayErrorMessage(quantityError);
    }

    function displayErrorMessage(message) {
        var errorMessageDiv = document.getElementById("errorMessage");
        errorMessageDiv.innerHTML = message;
        errorMessageDiv.style.display = "block";
        setTimeout(function () {
            errorMessageDiv.style.display = "none";
        }, 3000); // Hide the message after 3 seconds
    }
</script>
</head>
<!--<body>
     Error message container 
    <div id="errorMessage" class="error-message" style="display: none;"></div>-->

<!-- Your existing JSP content goes here -->

<!-- Include this script block at the end of your body content -->
<!--    <script>
        // Check for the presence of QUANTITY_ERROR attribute and display error message
        var quantityError = "<%= request.getAttribute("QUANTITY_ERROR")%>";
        if (quantityError && quantityError.trim() !== "") {
            displayErrorMessage(quantityError);
        }
    </script>-->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Function to open the modal and display mobile details
        const showModal = (mobileData) => {
            document.getElementById('modalShoesName').textContent = mobileData.shoesName;
            document.getElementById('modalDescription').textContent = mobileData.description;
            document.getElementById('modalPrice').textContent = mobileData.price;
            document.getElementById('modalYearOfProduction').textContent = mobileData.yearOfProduction;
            document.getElementById('modalQuantity').textContent = mobileData.quantity;
            document.getElementById('modalNotSale').textContent = mobileData.notSale;

            document.getElementById('mobileDetailModal').style.display = "block";
        };

        // Function to open the modal and display mobile details
        const showQuantityModal = (mobileData) => {
            console.log('hehe', mobileData.shoesId)
            document.getElementById('cartShoesId').value = mobileData.shoesId;

            document.getElementById('addToCartModal').style.display = "block";
        };

        // Event listener for closing the modal
        document.querySelector('.close-button').addEventListener('click', function () {
            document.getElementById('mobileDetailModal').style.display = "none";
        });

        // Event listener for closing the modal
        document.querySelector('.close-button-quantity').addEventListener('click', function () {
            document.getElementById('addToCartModal').style.display = "none";
        });

        // Attach an event listener to each row
        document.querySelectorAll('.quantity-button-adding').forEach(row => {
            row.addEventListener('click', function () {
                const quantityData = {
                    shoesId: this.getAttribute('data-mobile-cart-id'),
                };

                showQuantityModal(quantityData);
            });
        });

        // Attach an event listener to each row
        document.querySelectorAll('.clickable-row').forEach(row => {
            row.addEventListener('click', function () {
                const mobileData = {
                    shoesId: this.getAttribute('data-mobile-id'),
                    shoesName: this.getAttribute('data-mobile-name'),
                    description: this.getAttribute('data-description'),
                    price: this.getAttribute('data-price'),
                    yearOfProduction: this.getAttribute('data-year-of-production'),
                    quantity: this.getAttribute('data-quantity'),
                    notSale: this.getAttribute('data-not-sale'),
                    image: this.getAttribute('data-image')
                };
                console.log(mobileData)
                showModal(mobileData);
            });
        });

//            // Prevent row click when the "Add To Cart" button is clicked
//            document.querySelectorAll('.btn-add-cart').forEach(button => {
//                button.addEventListener('click', function (e) {
//                    e.stopPropagation();
//                });
//            });
    });
</script>

</html>
