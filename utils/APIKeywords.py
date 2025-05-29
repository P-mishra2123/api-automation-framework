import requests
import json
from utils.logger import get_logger

logger = get_logger(__name__)

class APIKeywords:
    def _log_response(self, response):
        logger.info(f"Status Code: {response.status_code}")
        logger.info(f"Response: {response.text}")

    def _validate_status_code(self, actual_status_code, expected_status_code):
        logger.info(f"Validating Status Code → Expected: {expected_status_code}, Actual: {actual_status_code}")
        if actual_status_code != int(expected_status_code):
            raise AssertionError(f"Status code mismatch: Expected {expected_status_code}, but got {actual_status_code}")

    def send_get_request(self, base_url, endpoint, headers=None, params=None, expected_status_code=None):
        try:
            response = requests.get(f"{base_url}{endpoint}", headers=headers, params=params)
            self._log_response(response)

            if expected_status_code is not None:
                self._validate_status_code(response.status_code, expected_status_code)
            response.raise_for_status()
            return response.json()
        except Exception as e:
            logger.error(f"GET request failed: {e}")
            raise

    def send_post_request(self, base_url, endpoint, payload=None, headers=None, expected_status_code=None):
        try:
            response = requests.post(f"{base_url}{endpoint}", json=payload, headers=headers)
            self._log_response(response)

            if expected_status_code is not None:
                self._validate_status_code(response.status_code, expected_status_code)

            response.raise_for_status()
            return response.json()
        except Exception as e:
            logger.error(f"POST request failed: {e}")
            raise

    def send_put_request(self, base_url, endpoint, payload=None, headers=None, expected_status_code=None):
        try:
            response = requests.put(f"{base_url}{endpoint}", json=payload, headers=headers)
            self._log_response(response)

            if expected_status_code is not None:
                self._validate_status_code(response.status_code, expected_status_code)

            response.raise_for_status()
            return response.json()
        except Exception as e:
            logger.error(f"PUT request failed: {e}")
            raise

    def send_delete_request(self, base_url, endpoint, headers=None, expected_status_code=None):
        try:
            response = requests.delete(f"{base_url}{endpoint}", headers=headers)
            self._log_response(response)

            if expected_status_code is not None:
                self._validate_status_code(response.status_code, expected_status_code)

            response.raise_for_status()
            return response.status_code
        except Exception as e:
            logger.error(f"DELETE request failed: {e}")
            raise
