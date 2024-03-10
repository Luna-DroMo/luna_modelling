import pandas as pd
from LUNA_Kalman import KalmanFilter

def fetch_data():
    # get a data and return into dataframe
    return pd.DataFrame()

def main():
    model = KalmanFilter()

    while True:
        data = fetch_data()

        predictions_state, predictions_cov, predictions_obs = model.forward(data)
        state_smooth, cov_smooth, K = model.rts_smoother(predictions_state, predictions_cov)


if __name__ == "__main__":
    main()
