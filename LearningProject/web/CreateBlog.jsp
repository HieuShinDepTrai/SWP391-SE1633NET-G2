<%-- 
    Document   : CreateBlog
    Created on : Oct 29, 2022, 5:26:26 PM
    Author     : HieuShin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Blog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link rel="stylesheet" href="assets/css/header.css" />
        <link rel="stylesheet" href="../assets/css/blog.css">
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#mytextarea'
            });
        </script>
    </head>

    <body style="font-family: 'Montserrat';">
        <div id="main">

            <div id="blog">
                <div class="row g-2 py-3 px-4">
                    <div class="col-12 fw-bolder fs-2 mb-2">Create Blog</div>
                    <div class="col-12 mb-2">Create your blog below</div>
                    <form action="createblog" method="POST">
                        <div class="col-12 row mt-2">
                            <div class="col-8">
                                <label class="form-label fw-bold">Blog title</label>
                                <input type="text" class="form-control mb-3" name="title">

                                <label class="form-label fw-bold">Blog description</label>
                                <input type="text" class="form-control mb-3" name="description">

                                <label class="form-label fw-bold">Category</label>
                                <select class="form-select" aria-label="Default select example" name="category">
                                    <option selected>Open this select menu</option>
                                    <option value="Front-end">Front-end</option>
                                    <option value="Back-end">Back-end</option>
                                    <option value="Database">Database</option>
                                </select>

                                <label class="form-label fw-bold mt-3">Blog Content</label>
                                <textarea id="mytextarea" name="content"></textarea>
                            </div>

                            <div class="col-4">
                                <div style="border: dashed 1px black; border-radius: 16px;">
                                    <img src="" alt="" style="width: 100%; height: 240px; object-fit: cover; border-radius: 16px;" class="image-thumbnail">
                                </div>
                                <div class="d-flex flex-column">
                                    <input type="file" name="" id="thumbnail" onchange="upload(this)" class="form-control mt-3 mx-auto">
                                    <textarea id="imageBase64" name="imageBase64" rows="5" cols="10" class="d-none"></textarea>
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary mt-3" value="Create Blog">
                    </form>
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="assets/js/create_course.js"></script>
        <script src="assets/js/home_page.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>
