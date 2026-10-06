from app.app import run_simulation


def test_run_simulation():
    result = run_simulation()

    assert result["status"] == "success"
    assert result["message"] == "Simulation completed successfully"
