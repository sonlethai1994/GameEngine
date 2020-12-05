#pragma once
#include "Core.h"


namespace GameEngine {
	class GE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// to be define in CLIENT
	Application* CreateApplication();
}


