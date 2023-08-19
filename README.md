This is a tutorial project to play with creating and using resources inside of Azure. In the end it aims to create a postgres db, and a simple frontend node project that can connect to that DB.

# Prerequisites

* You must have installed the `az` cli for Azure.
* This code is written using Linux. There might be problems running this on a different OS.
* There are some initial steps needed before this code comes into play. See setting up azure.

# Setting Up Azure

So you go an Azure account, brilliant!

Now you need to create a subscription. It might you have the free tier, then you have a free subscription. If not, you need to create one.

Now that you have a subscription you'll typically want to have a keyvault. Now as we all know you don't want to expose passwords in your git repository. To solve this problem Azure provides a service called `Key Vault`. Now we are presented slightly with a chicken or the egg problem here. To be able to run the bicep of this project (see the azure folder) you'll need there to be a password defined in a key vault. The problem is that this keyvault must exist inside the same resource group that you want to create your DB in.

I haven't found a smooth solution to this yet, but you can run the script given in the azure folder, which will create the resource group and then fail. Then you can manually create your key vault using the [Azure portal](portal.azure.com). Finally you create the secret in there and now you can run the create script again.
