<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="student-credit">Mohammed Ayman Siddiqui · CS-H · Roll 13 · PRN 12414007</div>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4">⚡ Electricity Bill Calculator</h2>

                        <form method="POST" action="calculate">
                            <div class="mb-3">
                                <label for="units" class="form-label">Enter Units Consumed</label>
                                <input
                                    type="number"
                                    step="0.01"
                                    min="0"
                                    class="form-control"
                                    id="units"
                                    name="units"
                                    value="${units != null ? units : ''}"
                                    placeholder="e.g. 150"
                                    required
                                >
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Calculate Bill</button>
                        </form>

                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger mt-4" role="alert">
                                ${error}
                            </div>
                        <% } else if (request.getAttribute("bill") != null) { %>
                            <div class="alert alert-success mt-4" role="alert">
                                <h5 class="mb-2">Bill Summary</h5>
                                <p class="mb-1">Units Consumed: <strong>${units}</strong></p>
                                <p class="mb-0">Total Bill: <strong>₹<%= String.format("%.2f", (Double) request.getAttribute("bill")) %></strong></p>
                            </div>
                        <% } %>

                        <div class="mt-4">
                            <h6>Tariff Slabs</h6>
                            <ul class="small text-muted">
                                <li>First 50 units: ₹3.50/unit</li>
                                <li>Next 100 units (51–150): ₹4.00/unit</li>
                                <li>Next 100 units (151–250): ₹5.20/unit</li>
                                <li>Above 250 units: ₹6.50/unit</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>