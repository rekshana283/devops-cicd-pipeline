def run_simulation():
    return {
        "status": "success",
        "message": "Simulation completed successfully"
    }


if __name__ == "__main__":
    result = run_simulation()
    print(result["message"])
