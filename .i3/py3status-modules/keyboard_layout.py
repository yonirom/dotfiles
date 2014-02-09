# -*- coding: utf-8 -*-

# netdata

# Netdata is a module uses great Py3status (i3status wrapper) to
# display network information (Linux systems) in i3bar.
# For more information read:
# i3wm homepage: http://i3wm.org
# py3status homepage: https://github.com/ultrabug/py3status

# Copyright (C) <2013> <Shahin Azad [ishahinism at Gmail]>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# ----------------------------------------------------------------- #
# Notes:
# 1. netdata will check 'eth0' interface by default. You can
# change it by changing 'self.net_interface' variable in 'GetData'
# class.
# 2. Colors are depended on strict specification in traffic/netspeed methods.
# You can change them by manipulating conditions.

import subprocess

class Py3status:
    """
    System status in i3bar
    """
    def keyboard_layout(self, json, i3status_config):
        """Calculate network speed ('eth0' interface) and return it.  You can
        change the interface using 'self.net_interface' variable in
        'GetData' class.

        """
        data = subprocess.check_output(["/usr/bin/xkblayout-state", "print" , "%s"])
        response = {'full_text': '', 'name': 'keyboard_layout'}

        response['full_text'] = data.rstrip()
        return (0, response)
