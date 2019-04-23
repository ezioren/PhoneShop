# -*- coding: utf-8 -*-
from django.core.exceptions import ValidationError
from rest_framework import exceptions
from rest_framework.views import exception_handler
from app import conts


class AppException(exceptions.APIException):
    """
        for django rest framework
    """

    def __init__(self, code, **kwargs):
        self.code = code
        self.detail = getattr(conts, self.code, '')
        if kwargs:
            self.detail = self.detail.format(**kwargs)

    def __str__(self):
        return '{}: {}'.format(self.code, self.detail)


def custom_exception_handler(exc, context):
    # Call REST framework's default exception handler first,
    # to get the standard error response.
    response = exception_handler(exc, context)

    # Now add the HTTP status code to the response.
    if response is not None:
        response.data['status_code'] = response.status_code
        if isinstance(exc, ValidationError):
            response.data['detail'] = exc.message
    return response
