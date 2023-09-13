import requests

def test_app_health_check():
    response = requests.get("http://localhost:5000")
    assert response.status_code == 200
    assert "webapp" in response.text

# Add more test cases as needed

