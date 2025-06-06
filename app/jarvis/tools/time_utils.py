from datetime import datetime
 
def get_current_time():
    """Return the current time as a string in a dictionary."""
    now = datetime.now()
    return {"current_time": now.strftime("%Y-%m-%d %H:%M:%S")} 