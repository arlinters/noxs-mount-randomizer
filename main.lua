local function randomMount(msg)
	ids = C_MountJournal.GetMountIDs()
	mountable = {}
	for i=1, #ids do
		 -- Fetch the extra info about this mount
		 _, _, _, isSelfMount, mountTypeID = C_MountJournal.GetMountInfoExtraByID(i)
		 -- Check if the mount id is mountable and owned
		 name, _, _, _, isUsable, _, _, _, _, _, isCollected, mountID = C_MountJournal.GetMountInfoByID(i)
		 if isUsable and isCollected then      
				if msg == 'fly' then
					if mountTypeID==248 then	
					table.insert(mountable,i)
					end
				else
					table.insert(mountable,i)
				end
		 end 
	end
	theChosenOne = random(#mountable)
	--SendChatMessage("I CHOOSE YOU, "..name.."!","YELL")
	C_MountJournal.SummonByID(mountable[theChosenOne])
end

SLASH_NOXMOUNT1 = '/noxrando'
SlashCmdList["NOXMOUNT"] = randomMount
