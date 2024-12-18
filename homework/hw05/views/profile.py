import json

from flask import Response, request
from flask_restful import Resource

from models import db
from models.post import Post


def get_path():
    return request.host_url + "api/profile/"


class ProfileDetailEndpoint(Resource):

    def __init__(self, current_user):
        self.current_user = current_user

    def get(self):
        user_id = self.current_user.id

        user = {
            "id": user_id,
            "first_name": self.current_user.first_name, 
            "last_name": self.current_user.last_name,    
            "username": self.current_user.username,
            "email": self.current_user.email,
            "image_url": self.current_user.image_url,    
            "thumb_url": self.current_user.thumb_url,
        }
        return Response(
            json.dumps({user}),
            mimetype="application/json",
            status=200,
        )


def initialize_routes(api, current_user):
    api.add_resource(
        ProfileDetailEndpoint,
        "/api/profile",
        "/api/profile/",
        resource_class_kwargs={"current_user": current_user},
    )

