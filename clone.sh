#
# Copyright (C) 2021 qaøtyk <mayniakgd@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Command List
CLONE="git clone -b"
GITHUB="https://github.com"
GITLAB="https:/gitlab.com"
USER=""

# Organization
DM="DoritosMotorola"
ND="NemesisDevelopers"

# Motorola Paths
DEVICE="device/motorola"
COMMON="device/motorola"
VENDOR="vendor/motorola"
KERNEL="kernel/motorola"
MOTCAMERA="packages/apps/MotCamera2"

# Setup
${CLONE} ${GITHUB}/${USER}/ ${DEVICE}
${CLONE} ${GITHUB}/${USER}/ ${COMMON}
${CLONE} ${GITHUB}/${USER}/ ${VENDOR}
${CLONE} ${GITHUB}/${USER}/ ${KERNEL}
