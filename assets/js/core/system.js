const statusButton = document.getElementById('statusButton');
const linkUrl = "https://monitor.codeindevelopers.com.ng/s/codeindevelopers/"; 
statusButton.addEventListener('click', function() {
    window.location.href = linkUrl; 
});
statusButton.addEventListener('mouseover', function() {
    statusButton.style.backgroundColor = '#e1e1e1';
    statusButton.style.transform = 'scale(1.05)';
    statusButton.style.border = '0px solid #007ccc'; 
});
statusButton.addEventListener('mouseout', function() {
    statusButton.style.backgroundColor = '#f5f5f5';
    statusButton.style.transform = 'scale(1)';
    statusButton.style.border = '0px solid #e1e1e1'; 
});