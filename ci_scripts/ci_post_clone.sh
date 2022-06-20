#!/bin/sh

sed 's/"API_KEY"/"${API_KEY}"/g' ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup.swift > ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup2.swift
mv ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup2.swift ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup.swift

sed 's/"BASE_URL"/URL(string: "${BASE_URL}")/g' ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup.swift > ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup2.swift
mv ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup2.swift ../Betzi/Configs/Environment/CI/DefaultEnvironmentSetup.swift
