document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById("signatureCanvas");
    const ctx = canvas.getContext("2d");
    const nameInput = document.getElementById("user_name");
    const generateBtn = document.getElementById("generateSignature");
    const clearBtn = document.getElementById("clearCanvas");
    const signatureDataInput = document.getElementById("signatureData");

    let isDrawing = false;
    let lastX = 0;
    let lastY = 0;

    // Font for name conversion
    const font = "50px 'Great Vibes', cursive"; // Use a more elegant script font

    // Draw Name as Signature
    function generateSignatureFromName() {
        if (!nameInput.value.trim()) return;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.font = font;
        ctx.fillStyle = "#000";
        ctx.textAlign = "left"; // Align text properly
        ctx.textBaseline = "middle"; 
        ctx.fillText(nameInput.value, 50, 80); // Adjust position for better alignment
        updateSignatureData();
    }
    
    // Start Drawing Signature
    function startDrawing(e) {
        isDrawing = true;
        [lastX, lastY] = [e.offsetX, e.offsetY];
    }

    // Draw Signature
    function draw(e) {
        if (!isDrawing) return;
        ctx.strokeStyle = "#000";
        ctx.lineWidth = 2;
        ctx.lineCap = "round";

        ctx.beginPath();
        ctx.moveTo(lastX, lastY);
        ctx.lineTo(e.offsetX, e.offsetY);
        ctx.stroke();

        [lastX, lastY] = [e.offsetX, e.offsetY];
        updateSignatureData();
    }

    // Stop Drawing
    function stopDrawing() {
        isDrawing = false;
        updateSignatureData();
    }

    // Update Hidden Input with Base64 Data
    function updateSignatureData() {
        signatureDataInput.value = canvas.toDataURL("image/png");
    }

    // Clear Canvas
    function clearCanvas() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        signatureDataInput.value = "";
    }

    // Event Listeners
    canvas.addEventListener("mousedown", startDrawing);
    canvas.addEventListener("mousemove", draw);
    canvas.addEventListener("mouseup", stopDrawing);
    canvas.addEventListener("mouseout", stopDrawing);
    generateBtn.addEventListener("click", generateSignatureFromName);
    clearBtn.addEventListener("click", clearCanvas);
});
