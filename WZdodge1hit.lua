if not game:IsLoaded() then
    game.Loaded:Wait()
end
game.Players.LocalPlayer.CharacterAdded:Wait()
local workspace = game:GetService("Workspace")
game.RunService.Heartbeat:Connect(function()
    if workspace:FindFirstChild("RadialIndicator") then
        local circle = workspace.RadialIndicator.Inner
        if circle.Size.y >= 165 then
            workspace.Mobs.BOSSFallenKing.Collider.CFrame = CFrame.new(workspace.MissionObjects.Spawn.Position)
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart.CFrame = CFrame.new(workspace.MissionObjects.Spawn.Position)
        end
    end
end)
